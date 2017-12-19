Feature: New website user sign up
  As a new user without an account
  In order to use the website
  I need to sign up

  Scenario: Successfully Sign up
    Given I am on the sign up page
    When I fill in "user_first_name" with "chen"
    And I fill in "user_last_name" with "zhe"
    And I choose "male"
    And I choose "driver"
    And I fill in "user_nickname" with "dog"
    And I fill in "user_password" with "12345678"
    And I fill in "user_password_confirmation" with "12345678"
    And I fill in "user_email" with "dog@cat.com"
    And I fill in "user_nickname" with "dog"
    And I fill in "user_phone" with "1234567890"
    Then I press "Create my account"
    Then I should be on the sign in page
    Then I should see "Welcome to UFreeRide! Please check your email to activate your account."

    Scenario: Unsuccessfully Sign up
      Given I am on the sign up page
      When I fill in "user_last_name" with "chen"
      And I choose "male"
      And I fill in "user_nickname" with "paulsmith"
      And I fill in "user_password" with "12345678"
      And I fill in "user_password_confirmation" with "123456"
      And I fill in "user_email" with "c@com"
      Then I press "Create my account"
      Then I should see "The form contains 5 errors."
      And I should see "First name can't be blank"
      And I should see "Phone can't be blank"
      And I should see "Status is not included in the list"
      And I should see "Email is invalid"
      And I should see "Password confirmation doesn't match Password"
