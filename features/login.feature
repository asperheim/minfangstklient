Feature: Login
  As a user
  I want to be able to log in to the app
  So I can start using the features it provides

Scenario: Example steps
  Given I am on the Welcome Screen
  Then I enter "toreb" into the "Brukernavn" input field
  Then I enter "pass1" into the "Passord" input field
  Then I touch the "Logg inn" button
  Then I wait to see a navigation bar titled "Min Fangst"

