Feature: Ability to create and manage snippets

  @snippet @create
  Scenario: Create a new snippet
    Given a user creates a snippet "My new snippet one"
    Then the snippet will be displayed

  @snippet @delete
  Scenario: Create a new snippet and delete it
    Given a user creates a snippet "My new snippet two"
    And the snippet is displayed
    When the user deletes the snippet
    Then the snippet will no longer be displayed
