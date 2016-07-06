Feature: Ability to create a new account

  Scenario: Create a new account
    Given a user without an account provides new credentials
    Then an account in that name will be created