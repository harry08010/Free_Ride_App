Feature: Edit user information
  As a website user
  In order to better use the website
  I want to edit my personal information

Background:
  Given I have signed up
  And I have been activated
  And I have logged in

Scenario: Successfully change user name/nickname/phone
  Given I am on the user show page
  When I follow "Settings"
  Then I should see "Update your information"
  And I fill in "user_first_name" with "CChen"
  And I fill in "user_last_name" with "ZZhe"
  And I fill in "user_phone" with "123456789"
  And I fill in "user_nickname" with "sam"
  Then I press "Update my account"
  Then I should be on the user show page
  And I should see "Profile updated"
  And I should see "CChen ZZhe"
  And I should see "sam"

 Scenario: Successfully change user status
    Given I am on the user show page
    And I am a driver
    When I follow "Settings"
    Then I should see "Update your information"
    And I choose "passenger"
    Then I press "Update my account"
    Then I should be on the user show page
    And I should see "Profile updated"
    And I should see "Passenger"
    And I should see "Applied Rides"

  Scenario: Successfully change user password
    Given I am on the user show page
    When I follow "Settings"
    Then I should see "Update your information"
    And I fill in "user_password" with "123456"
    And I fill in "user_password_confirmation" with "123456"
    Then I press "Update my account"
    Then I should be on the user show page
    And I should see "Profile updated"

    Scenario: Unsuccessfully change user password
      Given I am on the user show page
      When I follow "Settings"
      Then I should see "Update your information"
      And I fill in "user_password" with "123456"
      And I fill in "user_password_confirmation" with "1234567"
      Then I press "Update my account"
      Then I should be on the user show page
      And I should see "The form contains 1 error."
      And I should see "Password confirmation doesn't match Password"
