Feature: Add, edit or remove fish events from the map
  As a user
  I want to be able to edit my own fish events
  so that I can add, edit or remove details, or create a new fish event.
  
  Background:
    Given I am logged in
    And I am on the Map Screen
   
  @add_new_fish_event
  Scenario: Adding a new fish event
    When I long press on the map
    Then I wait to see a navigation bar titled "Ny hendelse"
    
    When I touch the "Done" button
    Then I should see "Hendelsen er lagret"
    And I touch the "OK" button
  