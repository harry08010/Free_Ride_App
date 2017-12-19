Feature: Driver Delete Posts
  As a driver
  In order to withdraw my posted offering free ride
  I want to delete my free ride posts

Background:
  Given I have signed up
  And I have been activated
  And I have logged in
  And I am a driver
  And I have already created a post

Scenario: Successfully post posts
  Given I am on the user show page
  Then I should see "Posted Rides (1)"
  When I follow "Delete"
  Then I should be on the user show page
  And I should see "Post deleted"
  And I should see "Posted Rides (0)"
