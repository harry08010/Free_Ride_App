Feature: Driver Confirm Posts
  As a driver
  In order to confirm my posted offering free ride when I have chosen my passengers
  I want to confirm/lock my free ride posts

Background:
  Given I have signed up
  And I have been activated
  And I have logged in
  And I am a driver
  And I have already created a post

Scenario: Successfully confirm post
  Given I am on the user show page
  Then I should see "Posted Rides (1)"
  When I press "Confirm Post"
  Then I should be on the user show page
  And I should see "post confirmed"
