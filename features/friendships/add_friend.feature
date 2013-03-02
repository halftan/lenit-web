@friends
Feature: Add friend
  In order to add a friend
  As a user
  I want to be able to add a friend
  
  Scenario: User is not signed in
    Given I am not logged in
    When I visit the homepage
    Then I should not see "Followers", "Follows"
  
  Scenario: User signed in
    Given I am logged in
    When I visit the homepage
    Then I should see "Followers", "Follows"
  
  Scenario: User add friend
    Given the following "user"
    | name   | email           | password |
    | first  | first@test.com  | password |
    | second | second@test.com | password |
    When I signin as "first@test.com" with password "password"
    And I visit the show page of "user" whose name is "second"
    And I click on "Follow" within ".links"
    Then I should have 1 "followed"
    And I should see "Successfully followed second"
    And User whose name is "second" should have 1 "follower"
  
  
