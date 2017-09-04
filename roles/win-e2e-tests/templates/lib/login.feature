Feature: Log into Octopus Deploy
  Scenario: Define Aliases
    Given I set the alias mappings
      | Username | inputUsername |
      | Password | inputPassword |
    And I set the default keystroke delay to "0" milliseconds

  Scenario: Do login
    Then I open the application
    Then I populate the "Username" textbox with alias "username"
    Then I populate the "Password" textbox with alias "password"
    Then I click the "Sign in" button
