Feature:
  As an application user
  I want to send myself messages as quickly and simply as possible

  #
  # Since IOS6 it is not possible to automate the testing of the mail composer view
  #
  # See: http://oleb.net/blog/2012/10/remote-view-controllers-in-ios-6/ for more info
  #

  @manual
  Scenario: Compose Email
    Given the application is opened after settings have been set
    Then I should see the email entry screen with the recipient and subject prefix already entered

  @manual
  Scenario: Compose Email
    Given the application is opened after settings have been set
    And I enter a message
    And I press the 'Send' button
    Then the message is sent to the recipient's email address
