Feature: Access control to Gruyere site

  @login @valid
  Scenario: Login with valid credentials
    Given the user logs in with the credentials "smckinney" and "password"
    Then the username "smckinney <smckinney>" should be displayed

  @login @invalid
  Scenario: Login with invalid credentials
    Given the user logs in with the credentials "smckinney" and "password1"
    Then the message "Invalid user name or password." should be displayed