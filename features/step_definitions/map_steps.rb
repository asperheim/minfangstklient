Given /^I am on the Map Screen$/ do
    macro 'I touch the "Map" button'
    macro %Q[I wait to see a navigation bar titled "Fiskekart"]
    sleep(STEP_PAUSE)
end

Given /^the map has fish event annotations$/ do
    element_exists("view:'MKAnnotationView'")
end

Given /^I have selected an annotation$/ do
    steps %Q{
        Given the map has fish event annotations
        When I touch the closest annotation
        Then I should see the fish event's title and comment
    }
end

When /^I touch the closest annotation$/ do
    # Will touch the first MKMapAnnotationView,
    # which, I assume, is the closest one in the displayed region of the map
    touch("view:'MKAnnotationView'")
    sleep(STEP_PAUSE)
end

Then /^I should see the fish event's title and comment$/ do
    # Should only get one result from selectedAnnotations, so should be safe
    selected = query("view:'MKMapView'", :selectedAnnotations).first

    # Gets the title 
    @title = /Title: (.*) -/.match(selected).captures.first.to_s

    element_exists(@title)
    sleep(STEP_PAUSE)
end

Then /^I wait to see a navigation bar with the title of the selected fish event$/ do
    wait_for(WAIT_TIMEOUT) do
        query('navigationItemView', :accessibilityLabel).include?(@title)
    end
end

When /^I long press on the map$/ do
    x_offset = 100 #rand(100)
    y_offset = 100 #rand(100)
    
    playback("long_press_map", :query => "view:'MKMapView'", :offset => {:x => x_offset, :y => y_offset})
end