@provided_events
Feature: Provider events
  In order to moderate a provider
  As a manager
  I want to add and delete and update events to a provider

  Background:
    Given I logged in
    And I have role "manager"
    And I have provider named "School"
  
  Scenario: I can add events to my provider
    Given I am on the show page of the provider named "School"
    When I click "New Event"
    And I fill in "Name" with "party"
    And I fill in "Location" with "classroom"
    And I click "Create"
    Then I should see "Successfully created event"
    And I should see "party", "classroom"
    
  Scenario: I cannot add events to other's provider
    Given the following "manager"
    | name   | email              | password |
    | first  | first@example.com  | password |
    And user named "first" has provider "Ossociation"
    When I goto the new_provider_provided_event page of provider named "Ossociation"
    Then I should see "You are not authorized"
    
  Scenario: update existing event
    Given provider "School" has event named "party" and location "classroom"
    When I am on the show page of the provided_event named "party"
    And I click on ".edit_link"
    Then Input "Name" should have value "party"
    When I fill in "Name" with "test"
    And I fill in "Location" with "home"
    And I click "Update"
    Then I should see "Successfully"
    And I should see "test", "home"
  
  Scenario: delete existing event
    Given provider "School" has event named "party" and location "classroom"
    When I am on the show page of the provided_event named "party"
    And I click on ".destroy_link"
    Then I should see "Successfully"
    And provider whose name is "School" should have 0 "provided_event"
    
# TODO: authorizing
