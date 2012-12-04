require 'net/http'
require 'json'
require 'uri'

CUCUMBER_ANNOTATION_TITLE = 'Cucumbers can create events too!'
HTTP_CLIENT = Net::HTTP.new('fishback.azurewebsites.net')

Before('@edit_fish_event') do
    create_fishevent
end

# Cleanup after the Adding a new fish event to the map
After('@add_new_fish_event, @edit_fish_event') do
    delete_cucumber_annotation(CUCUMBER_ANNOTATION_TITLE)
end

def delete_cucumber_annotation(annotation_title)
    request = Net::HTTP::Get.new("/api/fishevent?title=#{URI.escape(annotation_title)}")
    response = HTTP_CLIENT.request(request)
    
    # Parse the response to a hash
    hash = JSON.parse(response.body)
       
    hash['FishEvents'].each do |event|
        send_delete_request(event['Id'])
    end
end

def send_delete_request(id)
    request = Net::HTTP::Delete.new("/api/fishevent/#{id}")
    
    response = HTTP_CLIENT.request(request)
    puts(response)
end

def create_fishevent
    fish_event = {
        :User => {:Id => 1},
        :Location => {
            :Latitude => 59.88001,
            :Longitude => 10.81,
            :MAMSL => 25
        },
        :DateTime => Time.now,
        :Images => nil,
        :Title => CUCUMBER_ANNOTATION_TITLE,
        :Comment => "Cucumbers can comment"
    }
    
    # Sends post request
    request = Net::HTTP::Post.new('/api/fishevent/', initheader = {'Content-Type' => 'application/json'})
    request.body = fish_event.to_json
    
    response = HTTP_CLIENT.request(request)
    puts(response)
    
end