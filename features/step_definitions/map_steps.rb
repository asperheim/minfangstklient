CUCUMBER_ANNOTATION_OFFSET = {:x => 100, :y => 100}

Given /^I am on the Map Screen$/ do
    macro 'I wait for the "Map" button to appear'
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

Given /^I am on the Show Details Screen$/ do
    # Calls the long press step to be able to click on the exact same spot as
    # where the annotations is created. Could have been normal touch event.
    macro %Q[I long press on the map]
    macro %Q[I should see the fish event's title and comment]
    macro %Q[I touch the "disclose details" button]
    macro %Q[I wait to see a navigation bar with the title of the selected fish event]
end

When /^I touch the closest annotation$/ do
    # Will touch the first MKMapAnnotationView,
    # which, I assume, is the closest one in the displayed region of the map
    touch("view:'MKPinAnnotationView'")
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
    playback("long_press_map", :query => "view:'MKMapView'",
                                :offset => {:x => CUCUMBER_ANNOTATION_OFFSET[:x],
                                            :y => CUCUMBER_ANNOTATION_OFFSET[:y]})
    sleep(STEP_PAUSE)
end

Then /^I enter "([^\"]*)" into the "([^\"]*)" text view$/ do |text_to_type, field_name|
    set_text("textView marked:'#{field_name}'", text_to_type)
    sleep(STEP_PAUSE)
end

Given /^I have created a fish event titled "([^\"]*)"$/ do |title|
    # Gets the annotations
    # Uses .first because the query returns an array with one element
    # (due to only one map view on the screen), which returns a string where each
    # element is seperated by ',/n', so we split on that to get the elements
    annotations = query("view:'MKMapView'", :annotations).first.split(/,\n/)
    
    # Gets rid of the last element, which is the user location
    annotations.delete_at(annotations.length-1)
    
    # Alters the annotations array to only contain elements that has a
    # title which equals the title of the cucumber annotation
    annotations.select! { |annotation| /Title: (.*) -/.match(annotation).captures.first.to_s.eql?(title) }
    
    fail('There were no cucumber annotations on the map') if annotations.first == nil
    
    sleep(STEP_PAUSE)
end