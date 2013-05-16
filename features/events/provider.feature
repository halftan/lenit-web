@provider
Feature: Provider
  In order to manage a provider
  As a manager
  I want to confirm the user's identity
  
  Scenario: A manager wanna see his provider's info
    Given I logged in
    And I have role "manager"
    And I have a provider named "School"
    And I am on my homepage
    When I follow the "My Providers" link
    Then I should see "School"
    
  Scenario: A manager wanna register a provider
    Given I logged in
    And I have role "manager"
    And I am on my homepage
    When I click "Register Provider"
    And I fill in "Name" with "School"
    And I fill in "Description" with "My school"
    And I click "Create"
    Then I should have 1 "provider"
    And I should see "Successfully registered provider."
    And I should see "School", "My school"
    
  Scenario: A user should not see provider's link
    Given I logged in
    And I have not role "manager"
    When I visit my homepage
    Then I should not see "My Providers", "Register Provider"
    
  Scenario: A user should see all provider's info
    Given the following "manager"
    | name   | email              | password |
    | first  | first@example.com  | password |
    And user named "first" has provider "School"
    When I logged in
    And I click "All Providers"
    Then I should see "School"
    When I click "Show"
    Then I should not see "You are not authorized"
    
  Scenario: Other user should not edit my provider
    Given the following "manager"
    | name   | email              | password |
    | first  | first@example.com  | password |
    | second | second@example.com | password |
    And user named "first" has provider "School"
    When I login as "second@example.com" with password "password"
    And I goto the edit page of provider named "School"
    Then I should see "You are not authorized"
    But I sign out
    And I login as "first@example.com" with password "password"
    When I goto the edit page of provider named "School"
    Then I should not see "You are not authorized"
    And Input "Name" should have value "School"
  
  
