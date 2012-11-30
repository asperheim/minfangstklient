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
    touch(nil, {:offset => {:x => CUCUMBER_ANNOTATION_OFFSET[:x],
                            :y => CUCUMBER_ANNOTATION_OFFSET[:y]}})
    macro %Q[I should see the fish event's title and comment]
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

Given /^I (?:have created|create) a fish event titled "([^\"]*)"$/ do |title|
    macro %Q[I long press on the map]
    macro %Q[I wait to see a navigation bar titled "Ny hendelse"]
    macro %Q[I enter "#{title}" into the "Title" input field]
    macro %Q[I touch the "Done" button]
    macro %Q[I should see "Hendelsen er lagret"]
    macro %Q[I touch the "OK" button]
    
    sleep(STEP_PAUSE)
end