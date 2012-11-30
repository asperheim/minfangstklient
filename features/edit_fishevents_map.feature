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
    
    Then I enter "Cucumbers can create events too!" into the "Title" input field
    And I enter "This comment was created by a cucumber with a calabash..." into the "Comments" text view

    When I touch the "Done" button
    Then I should see "Hendelsen er lagret"
    And I touch the "OK" button
    
  @edit_fish_event  
  Scenario: Edit a fish event
    Given I have created a fish event titled "Cucumbers can create events too!"
    And I am on the Show Details Screen
    Then I touch the "Edit" button
    
    When I should see "Endre 'Cucumbers can create events too!'"
    Then I enter "Litt norsk her, litt engelsk der." into the "Comments" text view

    When I touch the "Done" button
    Then I see the text "Litt norsk her, litt engelsk der."
    
    
  
    
    
  