Feature: Logged in User log out
  As a website user
  In order to log out the website when not using website
  I want to sign out my account

Background:
  Given I have signed up
  And I have been activated
  And I have logged in

Scenario: Successfully sign out
  When I am on the user show page
  And I follow "Sign out"
  Then I should see "Sign in"
