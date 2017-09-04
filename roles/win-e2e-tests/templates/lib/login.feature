Feature: Log into Octopus Deploy
  Scenario: Define Aliases
    Given I set the alias mappings
      | Username | inputUsername |
      | Password | inputPassword |
    And I set the default keystroke delay to "0" milliseconds

  Scenario: Do login
    Then I open the page "http://localhost"
    Then I populate the "Username" textbox with "{{octopus_admin_username}}"
    Then I populate the "Password" textbox with "{{octopus_admin_password}}"
    Then I click the "Sign in" button
