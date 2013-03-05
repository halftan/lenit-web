@focus
Feature: See event
  In order to see what event my friend provide
  As a follower
  I want to be advised about my friends' new events

  Background:
    Given the following "user"
    | name   | email           | password |
    | first  | first@test.com  | password |
    And the following "manager"
    | name   | email           | password |
    | second | second@test.com | password |
    And User whose name is "first" follows "second"
    Given I signin as "first@test.com" with password "password"
    And I should have 1 "followed"

  Scenario: user added a event and the other should be advised
    Given User whose name is "second" adds personal_event name "party" and location "home"
    When I click on "Lenit"
    Then I should see "party", "home", "second"
  
  Scenario: the provider has a new event
    Given user named "second" has provider "School"
    And provider named "School" has event named "party" location "classroom"
    When I visit my homepage
    Then I should see "party", "School", "classroom"
  
  
  
  
# TODO: view events after follow
# CHANGED: 每个manager只能注册一个provider