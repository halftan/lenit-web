@personal_events
Feature: Host personal events
  In order to host personal events
  As a user
  I want to create and manager events

  Scenario: Events list
    Given I logged in
    And personal events titled "party", "picnic"
    And I am on my homepage
    When I follow the "Events" link
    Then I should see "party", "picnic"

  Scenario: Manager personal events
    Given I logged in
    And personal events titled "party"
    And I am on the show page of the personal event named "party"
    When I follow the ".edit_link" link
    And I fill in "Name" with "picnic"
    And I fill in "Location" with "some place"
    And I click "Update"
    Then I should see "Successfully"
    And I should see "picnic"
    And I should not see "party"

  Scenario: Create new event
    Given I logged in
    And I am on my homepage
    When I click "New Event"
    And I fill in "Name" with "party"
    And I fill in "Location" with "home"
    And I click "Create"
    Then I should see "Successfully"
    And I should see "party", "home"
  
  Scenario: Delete event
    Given I logged in
    And personal events titled "party"
    And I am on the show page of the personal event named "party"
    When I click "Destroy"
    And I follow the "Events" link
    Then there are 0 personal events
  
  
  
  
