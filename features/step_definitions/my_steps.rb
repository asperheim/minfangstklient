DASHBOARD_TITLE = 'Min Fangst'
USERNAME_PLACEHOLDER = 'Brukernavn'
PASSWORD_PLACEHOLDER = 'Passord'
USERS = {'Anders' => {:username => 'andersa', :password => 'pass2'},
         'Tore' => {:username => 'toreb', :password => 'pass1'} }

Given /^I am on the Login Screen$/ do
  view_with_mark_exists('Logg inn')
  sleep(STEP_PAUSE)
end

Given /^I am on the Dashboard Screen$/ do
    view_with_mark_exists(DASHBOARD_TITLE)
    sleep(STEP_PAUSE)
end

Then /^I log in$/ do
    step %Q[I log in as #{'Anders'}]
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
    sleep(STEP_PAUSE)
end

Then /^I should see an activity indicator$/ do
    element_exists("gray activity indicator")
    sleep(STEP_PAUSE)
end
                    
Then /^I should see a login error message$/ do
    view_with_mark_exists("Login Error Message")
    sleep(STEP_PAUSE)
end
