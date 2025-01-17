Feature: conversation

  Scenario: join a public conversation
    Given I act as John
    And I am logged in
    And I have opened the Talk app
    And I create a public conversation named "Public"
    And I write down the public conversation link
    When I act as Jane
    And I visit the public conversation link I wrote down
    Then I see that the current page is the public conversation link I wrote down



  Scenario: set a password to a public conversation
    Given I am logged in
    And I have opened the Talk app
    And I create a public conversation named "Public"
    And I see that the conversation is not password protected
    When I protect the conversation with the password "abcdef"
    Then I see that the conversation is password protected

  Scenario: join a public conversation protected by password with a valid password
    Given I act as John
    And I am logged in
    And I have opened the Talk app
    And I create a public conversation named "Public"
    And I protect the conversation with the password "abcdef"
    And I see that the conversation is password protected
    And I write down the public conversation link
    When I act as Jane
    And I visit the public conversation link I wrote down
    And I see that the current page is the Authenticate page for the public conversation link I wrote down
    And I authenticate with password "abcdef" in public conversation
    Then I see that the current page is the public conversation link I wrote down

  Scenario: join a public conversation protected by password with an invalid password
    Given I act as John
    And I am logged in
    And I have opened the Talk app
    And I create a public conversation named "Public"
    And I protect the conversation with the password "abcdef"
    And I see that the conversation is password protected
    And I write down the public conversation link
    When I act as Jane
    And I visit the public conversation link I wrote down
    And I see that the current page is the Authenticate page for the public conversation link I wrote down
    And I authenticate with password "fedcba" in public conversation
    Then I see that the current page is the Wrong password page for the public conversation link I wrote down
