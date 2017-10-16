Feature: Create a Hello World Octopus Deploy Project
  Scenario: Configure Aliases
    Given I set the alias mappings
      | New Project Name | HelloWorldProject |
    And I save the current date with the format "yyyyMMddHHmmSS" to the alias "Now"
    And I modify the alias "New Project Name" by appending it with alias "Now"

# Importing these features will log us into Octopus Deploy and create a project with the
# value in the alias "New Project Name"

#IMPORT: lib/login.feature
#IMPORT: lib/create-project.feature