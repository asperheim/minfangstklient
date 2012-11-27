Feature: View fish events on the map
  As a user
  I want to be able to view fish events on the map
  so that I can get an overview of all the good fishing locations
  
  Background:
    Given I am logged in
    And I am on the Map Screen
    
  Scenario: User should see a map
    Then I should see a map
    
  Scenario: User should be able to click on fish events to see it's title and comment
    Given the map has fish event annotations
    When I touch the closest annotation
    Then I should see the fish event's title and comment
    
  Scenario: User should be able to view extended details for a fish event by clicking the disclose details button
    Given I have selected an annotation
    When I touch the "disclose details" button
    Then I wait to see a navigation bar with the title of the selected fish event
    
  
    
    

  