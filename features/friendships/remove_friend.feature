@friends
Feature: Remove friend
  In order to remove a friend
  As a user
  I want to be able to remove followed friend
  
  Background:
    Given the following "user"
    | name   | email           | password |
    | first  | first@test.com  | password |
    | second | second@test.com | password |
    And User whose name is "first" follows "second"
    Given I signin as "first@test.com" with password "password"
    And I should have 1 "followed"
  
  Scenario: User remove friend from the followed user's page
    When I visit the show page of "user" whose name is "second"
    When I click "Unfollow"
    Then I should have 0 "followed"
    And User whose name is "second" should have 0 "follower"
    And I should see "Successfully unfollowed second"
  
  Scenario: User remove friend from his followed user list
    When I visit the list of my followed users
    Then I should see "second"
    When I click "Unfollow"
    Then I should have 0 "followed"
    And User whose name is "second" should have 0 "follower"
    And I should see "Successfully unfollowed second"

