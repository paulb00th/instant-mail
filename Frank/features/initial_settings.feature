Feature:
  As an application user
  I want to enter my default setting
  So I can send myself quick messages

  Scenario: First run
    Given the application is opened for the first time
    Then I should see the application settings screen

  Scenario: Recipient email entered
    Given the application is opened for the first time
    And I enter a valid email address for the recipient
    And I press the 'Done' button
    Then I should see the email entry screen

  Scenario: Recipient email entered incorrectly
    Given the application is opened for the first time
    And I have entered an invalid email address for the recipient
    And I press the 'Done' button
    Then I should still see the application settings screen
