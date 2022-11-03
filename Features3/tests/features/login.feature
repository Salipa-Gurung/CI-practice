Feature: 
    As User
    I want to login 
    So that I can add new contacts

    Background:
        Given User has navigated to register page
        And User registers new account entering following credentials
            |name|  email      |password|confirmPassword|
            |abc |abc@gmail.com|abc12345|abc12345       |
        And user has logged out 
        And the user has navigated to login page

    Scenario: Login with valid credential
        When user login with following credentials
            |   email     |password|
            |abc@gmail.com|abc12345|
        Then user should be navigated to Contact Fox page

    Scenario Outline: Login with invalid credential
        When user login with following credentials
            |email  |password  |
            |<email>|<password>|
        Then error message "<errorMessage>" should be shown
        Examples:
            |   email     |password|errorMessage              |
            |abc@gmail.com|abc     |Invalid credentials.      |
            |xyz@gmail.com|abc12345|Invalid credentials.      |
            |abc@gmail.com|        |Please fill in all fields.|
            |             |abc12345|Please fill in all fields.|
            |             |        |Please fill in all fields.|

    # Scenario: Login with invalid email format 
    #     When user login with following credentials
    #         |   email    |password|
    #         |abcgmail.com|abc12345|
    #     Then validation error message "Please include an '@' in the email address."

# Login with invalid credential using example scenario
# Suppose valid email is "email" and password is "password"

    #  Scenario Outline: Login with invalid credential
    #     When user enters incorrect credentials with email "<email>" and password "<password>"
    #     And user clicks login button
    #     Then error message "Invalid credentials" should be shown
    #     Examples:
    #     |email | password|
    #     |abc@gmail.com|abc|
    #     |cde@gmail.com|cde|
    #     |efg@gmail.com|efg|
