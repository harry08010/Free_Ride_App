Feature: Driver Approve/Unapporve Applicants
  As a driver
  When others apply for my posts
  I want to approve my posts' applicants or unapprove the applicants who I have approved

Background:
  Given I have signed up
  And I have been activated
  And I have logged in
  And I am a driver
  And I have already created a post
  And Someone has applied for my post

Scenario: Successfully approve applicant
  Given I am on the user show page
  Then I should see "Posted Rides (1)"
  And I should see "Applicant(s) (1)"
  When I press "Approve"
  Then I should be on the user show page

  Scenario: Successfully unapprove applicant
    Given I am on the user show page
    Then I should see "Posted Rides (1)"
    And I should see "Applicant(s) (1)"
    When I press "Approve"
    Then I should be on the user show page
    When I press "Unapprove"
    Then I should be on the user show page
