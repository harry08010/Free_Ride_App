Feature: Passenger Apply/Unapply Posts
  As a passenger
  In order to let drivers know I want to be their passenger or I have changed my mind
  I want to apply thier posts or unapply posts that I have applied

Background:
  Given I have signed up
  And I have been activated
  And I have logged in
  And I am a passenger
  And Someone has posted a post

Scenario: Successfully apply a post
  Given I am on the user show page
  Then I should see "Applied Rides (0)"
  When I press "Search"
  Then I should see "start"
  When I press "Apply"
  Then I should see "start"
  When I follow "Profile"
  Then I should see "Applied Rides (1)"

  Scenario: Successfully unapply a post
    Given I am on the user show page
    Then I should see "Applied Rides (0)"
    When I press "Search"
    Then I should see "start"
    When I press "Apply"
    Then I should see "start"
    When I follow "Profile"
    Then I should see "Applied Rides (1)"
    When I press "Unapply"
    Then I should see "Applied Rides (0)"
