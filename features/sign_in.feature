Feature: Activated User Sign In
  As a driver or passenger
  In order to use the website
  I want to sign in my account

Background:
  Given I have signed up
  And I have been activated

Scenario: Successfully sign in
  Given I am on the home page
  When I fill in "session_email" with "czcz@test.com"
  And I fill in "session_password" with "password"
  And I press "Sign in"
  Then I should be on the user show page

  Scenario: Unsuccessfully sign in
    Given I am on the home page
    When I fill in "session_email" with "czcz@test.com"
    And I fill in "session_password" with "passwordd"
    And I press "Sign in"
    Then I should be on the sign in page
    And I should see "Invalid email/password combination"
