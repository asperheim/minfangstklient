Feature: Login
  As a user
  I want to be able to log in to the app
  so I can start using the features it provides

    Scenario: User login successful
        Given I am on the Login Screen
        And I log in as Anders
        Then I am on the Dashboard Screen
        
    Scenario: User should see activity indicator while login is in progress
        Given I am on the Login Screen
        And I log in
        Then I should see an activity indicator
        
    Scenario: User login failure
        Given I am on the Login Screen
        And I log in as an invalid user
        Then I should see a login error message
        
    Scenario: User should not be able to click login again while login is in progress
        Given I am on the Login Screen
        And I log in as Tore
        Then something...
        
  

