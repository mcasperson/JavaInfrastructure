# When importing this library, the "New Project Name" alias needs to be defined
Feature: Create a project
  Scenario: Define Aliases
    Given I set the alias mappings
      | Project name | //input[contains(@id, 'Newprojectname')] |
      | Add project | //button[contains(text(), 'ADD PROJECT')] |

  Scenario: Create project
    Given I open the application "projects"
    Then I click the "Add project" button
    Then I populate the "Project name" textbox with alias "New Project Name"
