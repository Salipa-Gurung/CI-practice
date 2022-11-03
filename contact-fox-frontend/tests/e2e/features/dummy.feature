Feature: 
    As User
    I want to login 
    So that I can visit Contax Fox page

    Background:
        Given the user has navigated to login page

    # Scenario: Login with valid credential
    #     When user enters correct credentials with email "valid email" and password "valid password"
    #     Then user should be navigated to Contact Fox page

    Scenario Outline: Login with invalid credential
        When user enters incorrect credentials with email "<email>" and password "<password>"
        And user clicks login button
        Then error message "Invalid credentials" should be shown
        Examples:
        |email | password|
        |abc@gmail.com|abc|
        |cde@gmail.com|cde|
        |efg@gmail.com|efg|

    Scenario: Login with valid credential
        When User logins with valid credentials 
            |   email     |password|
            |abc@gmail.com|abc123  |
            |abc@gmail.com|abc123  |
        Then user should be navigated to Contact Fox page
