Given /^I am on the Login Screen$/ do
  element_exists("view")
  sleep(STEP_PAUSE)
end

Then /^I log in$/ do
    macro 'I enter "toreb" into the "Brukernavn" input field'
    macro 'I enter "pass1" into the "Passord" input field'
    macro 'I touch the "Logg inn" button'
    macro 'I wait to see a navigation bar titled "Min Fangst"'
end