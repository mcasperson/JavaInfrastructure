Feature: Log into Octopus Deploy
  Scenario: Define Aliases
    Given I set the alias mappings
      | Username | inputUsername |
      | Password | inputPassword |
    And I set the default keystroke delay to "0" milliseconds
    And I set the default wait for elements to be available to "30" seconds

  Scenario: Do login
    Then I open the application
    Then I populate the "Username" textbox with "username"
    Then I populate the "Password" textbox with "password"
    Then I click the "Sign in" button
