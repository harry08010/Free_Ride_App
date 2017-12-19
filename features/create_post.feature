Feature: Driver Post Posts
  As a driver
  In order to let people know my offering free ride
  I want to post my free ride posts

Background:
  Given I have signed up
  And I have been activated
  And I have logged in
  And I am a driver

Scenario: Successfully post posts
  Given I am on the new post page
  When I fill in "ride_post_starting_point" with "start"
  And I fill in "ride_post_destination" with "end"
  And I fill in "ride_post_available_seat_number" with "2"
  And I fill in "ride_post_date" with "2018-01-01"
  And I fill in "ride_post_time" with "2000-01-01 19:00:00"
  And I fill in "ride_post_note" with "testnote"
  And I press "Post"
  Then I should be on the user show page

  Scenario: Unsuccessfully post posts
    Given I am on the new post page
    When I fill in "ride_post_destination" with "destination"
    And I fill in "ride_post_available_seat_number" with "-1"
    And I fill in "ride_post_date" with "2018-01-01"
    And I fill in "ride_post_note" with "testnote"
    And I press "Post"
    Then I should see "The form contains 3 errors."
    And I should see "Starting point can't be blank"
    And I should see "Available seat number must be greater than 0"
    And I should see "Time can't be blank"
