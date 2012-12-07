Feature: Navigate from the dashboard view to other views accessible from the dashboard
  As a user
  I want to be able to navigate from the dashboard
  so that I can access the different features the app offers
    
  Background:
    Given I am logged in
    And I am on the Dashboard Screen

  Scenario: Navigate to Blog Entries
    When I touch the "Blog Entries" button
    Then I wait to see a navigation bar titled "Blogginnlegg"
        
  Scenario: Navigate to Fish Recognition
    When I touch the "Fish Recognition" button
    Then I wait to see a navigation bar titled "Fiskegjenkjenning"
        
  Scenario: Navigate to Map
    When I touch the "Map" button
    Then I wait to see a navigation bar titled "Fiskekart"
        
  Scenario: Navigate to Fish Info
    When I touch the "Fish Info" button
    Then I wait to see a navigation bar titled "Fiskeinfo"
        
  Scenario: Navigate to Settings
    When I touch the "Settings" button
    Then I wait to see a navigation bar titled "Innstillinger"
        	
        