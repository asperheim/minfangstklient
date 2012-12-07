Feature: Taking and uploading pictures
  As a user
  I want to be able to take pictures of fish and upload them
  So that they are stored in the cloud.
  
  Background:
    Given I am logged in
    And I navigate to the Camera Screen

  Scenario: Accessing the camera
    When I touch the "Camera" button
    Then I am on the camera interface screen
    
  Scenario: Taking a picture
    Given I am on the camera interface screen
    When I take a picture
    Then I should see the picture I just took
    
  Scenario: Saving a picture
    Given I have taken a picture
    Then I should be able to save the picture
    
  Scenario: Discarding a picture
    Given I have taken a picture
    Then I should be able to discard the picture
    
  Scenario: Uploading a picture
    Given I have taken a picture
    And I am viewing the picture
    Then I should be able to upload the picture
