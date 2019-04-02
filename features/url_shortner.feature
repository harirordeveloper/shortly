Feature: URL shortner
  As a user
  I want to shorten my long URL
  So that it's easy for me to share

  Scenario: User lands on URL shorten page with form
    Given I am on the home page
    Then I should see the URL Shorten form
    And I enter my long URL in the form
    And I click on Shorten button
    Then I should see a shorten URL

  Scenario: User loads short URL
    Given a Link exists
    When short URL is visited
    Then I should see the redirect to Original Page

  Scenario: User is on stats page
    Given I am on stats page
    Then I should see stats data
