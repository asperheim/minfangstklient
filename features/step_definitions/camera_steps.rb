
Given /I navigate to the Camera Screen$/ do
    macro %Q[I touch the "Fish Camera" button]
    macro %Q[I wait to see a navigation bar titled "Fiskekamera"]
    
    sleep(STEP_PAUSE)
end

Given /^I am on the camera interface screen$/ do
    wait_for(WAIT_TIMEOUT) do
        # When camera isnt availible it'll be 'Photos'
        view_with_mark_exists('Photos') or view_with_mark_exists('something camera specific')
    end
    
    sleep(STEP_PAUSE)
end

When /^I take a picture$/ do
    view_with_mark_exists('Photo') ? fake_take_picture : take_picture
end

And /^I should see the picture I just took$/ do
    
end

# Fakes taking a picture by choosing a picture from the Photo Library
def fake_take_picture
    @has_camera = false
    
    macro %Q[I touch list item number 1]
    macro %Q[I wait to see a navigation bar titled "Saved Photos"]
    macro %Q[I touch list item number 1]
    macro %Q[I should see the picture I just took]
    
    sleep(STEP_PAUSE)
end

# Does something when using the actual camera
def take_picture
    @has_camera = true
end