Feature: Login
  As a user
  I want to be able to log in to the app
  so I can start using the features it provides

  Background:
    Given I am on the Login Screen

  Scenario: User login successful        
    When I log in as Anders
    Then I am on the Dashboard Screen

  Scenario: User login failure
    When I log in as an invalid user
    Then I should see "Login Error"
        
  Scenario: User should see activity indicator while login is in progress
    When I log in
    Then I should see an activity indicator
        
  Scenario: User should not see the activity indicator if a login error occured
    When I log in as an invalid user
    Then I should not see an activity indicator
        
  Scenario: User should not be able to click login again while login is in progress
    When I log in as Tore
    Then I should see "Logg inn disabled"
        
  Scenario: User should be able to click login again if login error occured
    When I log in as an invalid user
    Then I wait to see "Login Error"
    Then I touch the "OK" button
    Then I wait to see "Logg inn"
        
            
        
        
  

