DASHBOARD_TITLE = 'Min Fangst'
USERNAME_PLACEHOLDER = 'Brukernavn'
PASSWORD_PLACEHOLDER = 'Passord'
ACTIVITY_INDICATOR = 'gray activity indicator'

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
    view_with_mark_exists(DASHBOARD_TITLE)
    
    # Waits for 1.5 sec to make sure the dashboard is completely loaded
    # Should fixes random fails (probably due to animated navigation)
    sleep(1.5)
end

Then /^I log in$/ do
    step %Q[I log in as #{'Anders'}]
end
                    
Given /^I am logged in$/ do
    steps %Q{
        Given I am on the Login Screen
        When I log in
        Then I am on the Dashboard Screen
    }
end

Then /^I should see an activity indicator$/ do
  element_exists(ACTIVITY_INDICATOR)
  sleep(STEP_PAUSE)
end
   
Then /^I should not see an activity indicator$/ do
  element_does_not_exist(ACTIVITY_INDICATOR)
  sleep(STEP_PAUSE)
end

Then /^I log in as ([^\"]*)$/ do |user|
    username = 'username'
    password = 'password'
                    
    if USERS.has_key?(user)
        username = USERS[user][:username];
        password = USERS[user][:password];
    end
                    
    macro %Q[I enter "#{username}" into the "#{USERNAME_PLACEHOLDER}" input field]
    macro %Q[I enter "#{password}" into the "#{PASSWORD_PLACEHOLDER}" input field]
    macro 'I touch the "Logg inn" button'
end
