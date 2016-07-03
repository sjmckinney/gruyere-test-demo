Feature: Ability of user to login into Gruyere site

  Scenario: Login with valid credentials
    Given the user provides the credentials "" and ""
    When the user logs in
    Then the result should be "successful"

  Scenario: Login with invalid credentials
    Given the user provides the credentials "" and ""
    When the user logs in
    Then the result should be "unsuccessful"