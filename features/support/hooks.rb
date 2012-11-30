require 'net/http'

CUCUMBER_ANNOTATION_TITLE = 'Cucumbers can create events too!';

# Cleanup after the Adding a new fish event scenario
After('@add_new_fish_event, @edit_fish_event') do
    remove_annotation_from_map(CUCUMBER_ANNOTATION_TITLE)
end

# Doesnt work as it should, it rarely gets executed, due to failure
# when querying the map (first line), which makes me believe that the simulator
# sometimes shuts down too quickly
def remove_annotation_from_map(annotation_title)
    annotations = query("view:'MKMapView'", :annotations).first.split(/,\n/)
    
    # Gets rid of the last element, which is the user location
    annotations.delete_at(annotations.length-1)
    
    # Alters the annotations array to only contain elements that has a
    # title which equals the title of the cucumber annotation
    annotations.select! { |item| /Title: (.*) -/.match(item).captures.first.to_s.eql?(annotation_title) }
    
    # Returns if there wasnt a cucumber annotation
    annotation = annotations.first
    return if annotation == nil
    
    # Gets the Id
    event_id = /Id: (\d+)/.match(annotation).captures.first.to_s
    
    send_delete_request(event_id)
end

def send_delete_request(id)
    http = Net::HTTP.new("fishback.azurewebsites.net")
    
    request = Net::HTTP::Delete.new("/api/fishevent/#{id}")
    
    response = http.request(request)
    puts(response)
end