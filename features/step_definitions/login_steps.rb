DASHBOARD_TITLE = 'Min Fangst'
USERNAME_PLACEHOLDER = 'Brukernavn'
PASSWORD_PLACEHOLDER = 'Passord'
ACTIVITY_INDICATOR_QUERY = 'ActivityIndicatorView isAnimating:1'

USERS = {'Anders' => {:username => 'andersa', :password => 'pass2'},
         'Tore' => {:username => 'toreb', :password => 'pass1'} }

# Redefines the WAIT_TIMEOUT constant to 15 (half of it's original value),
# to reduce the wait if something fails.
# There's probably a better way to do this.
WAIT_TIMEOUT = 15;

Given /^I am on the Login Screen$/ do
    view_with_mark_exists('Logg inn')
    sleep(STEP_PAUSE)
end

Given /^I am on the Dashboard Screen$/ do
    wait_for(WAIT_TIMEOUT) do
        view_with_mark_exists(DASHBOARD_TITLE)
    end
    @login_is_in_progress = false
    
    sleep(STEP_PAUSE)
end

Then /^I log in$/ do
    macro %Q[I log in as "Anders"]
end
                    
Given /^I am logged in$/ do
    macro 'I am on the Login Screen'
    macro 'I log in'
    macro 'I am on the Dashboard Screen'
    
    sleep(STEP_PAUSE)
end

Given /^login is in progress$/ do
    unless @login_is_in_progress
       fail('login not in progress')
    end
end

Then /^I should see an activity indicator$/ do
    #activity_indicator_animating?
    check_element_exists(ACTIVITY_INDICATOR_QUERY)
    sleep(STEP_PAUSE)
end
   
Then /^I should not see an activity indicator$/ do
    #!activity_indicator_animating?
    check_element_does_not_exist(ACTIVITY_INDICATOR_QUERY)
    sleep(STEP_PAUSE)
end

Then /^I log in as "([^\"]*)"$/ do |user|
    username = 'username'
    password = 'password'
                    
    if USERS.has_key?(user)
        username = USERS[user][:username];
        password = USERS[user][:password];
    end
                    
    macro %Q[I enter "#{username}" into the "#{USERNAME_PLACEHOLDER}" input field]
    macro %Q[I enter "#{password}" into the "#{PASSWORD_PLACEHOLDER}" input field]
    macro 'I touch the "Logg inn" button'
    
    @login_is_in_progress = true
    # No sleep here, needs to be instant to check for activity indicators and such
end

Then /^I should not be able to click "([^\"]*)"$/ do |label|
    check_element_does_not_exist(button_enabled?(label))
    sleep(STEP_PAUSE)
end

Then /^I should be able to click "([^\"]*)"$/ do |label|
    check_element_exists(button_enabled?(label))
    sleep(STEP_PAUSE)
end

def button_enabled?(label)
    return "button marked:'#{label}' isEnabled:1"
end