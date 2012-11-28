require "net/http"

# Cleanup after the Adding a new fish event scenario
After('@add_new_fish_event') do
    annotations = query("view:'MKMapView'", :annotations).first.split(/,\n/)
    
    # Gets the last annotation, which will hopefully be the most recently added one
    # length - 2 because the last element in the array will be the user location
    last = annotations[annotations.length - 2]
    
    # Gets the Id
    event_id = /Id: (\d+)/.match(last).captures.first.to_s
    puts event_id
    
    send_delete_request(event_id)
end

def send_delete_request(id)
    http = Net::HTTP.new("fishback.azurewebsites.net")
    
    request = Net::HTTP::Delete.new("/api/fishevent/#{id}")
    
    response = http.request(request)
    puts(response)
end