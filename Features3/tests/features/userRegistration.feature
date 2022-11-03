Feature: Register new user account
    As a user 
    I want to register new account
    So that I can use Contact Fox App

    Background:
        Given User has navigated to register page

    Scenario: Register with all valid credentials
        When User registers new account entering following credentials
            |name|  email      |password|confirmPassword|
            |abc |abc@gmail.com|abc12345|abc12345       |
        Then new user should be navigated to Contact Fox Home page

    Scenario: Register with email same as of already created account
        Given account has been created with following credentials
            |name|  email      |password|confirmPassword|
            |abc |abc@gmail.com|abc12345|abc12345       |  
        And user has navigated to home page
        And user has logged out 
        And User has navigated to register page
        When User registers new account entering following credentials
            |name|  email|password  |confirmPassword  |
            |abc |abc@gmail.com|abc12345|abc12345       |  
        Then pop up should appear showing informational message as "User already exists. Please choose another email address." on the webUI

    Scenario: Register with different password and confirm password
        When User registers new account entering following credentials
            |name|  email      |password|confirmPassword|
            |abc |abc@gmail.com|abc12345|abc6789        |
        Then pop up should appear showing informational message as "Passwords do not match." on the webUI

    Scenario Outline: Register with empty input fields
        When User registers new account entering following credentials
            |name  |  email |password  |confirmPassword  |
            |<name>|<email> |<password>|<confirmPassword>|
        Then pop up should appear showing informational message as "Please enter all fields." on the webUI
        Examples:
            |name|  email      |password|confirmPassword |
            |    |abc@gmail.com|abc12345|abc12345        |
            |abc |             |abc12345|abc12345        |
            |abc |abc@gmail.com|        |abc12345        |
            |    |abc@gmail.com|abc12345|abc12345        |
            |    |             |abc12345|abc12345        |
            |abc |             |        |abc12345        |
            |abc |abc@gmail.com|        |                |
            |    |abc@gmail.com|abc12345|                |
            |abc |             |        |                |
            |    |abc@gmail.com|        |                |
            |    |             |abc12345|                |
            |    |             |        |abc12345        |
            |    |             |        |                |

    # Scenario: Register with invalid email format
    #     When User registers new account entering following credentials
    #         |name|  email     |password|confirmPassword|
    #         |abc |abcgmail.com|abc12345|abc12345       |
    #     Then validation error message as "Please include an '@' in the email address.'abcgmail.com' is missing an '@'" should pop up on email input field

    # Scenario Outline: Register with all valid credentials
    #     When User registers new account entering name as "<name>", email as "<email>", password as "<password>", confirm password as "<confirm-password>"
    #     Then new user should navigate to Contact Fox Home page
    #     Examples:
    #         |name|  email      |password|confirm-password|
    #         |abc |abc@gmail.com|abc12345|abc12345        |
    #         |xyz |xyz@gmail.com|xyz12345|xyz12345        |

    # Scenario Outline: Register with password less than six characters
    #     When User registers new account entering following credentials
    #         |name   |  email|password  |confirmPassword  |
    #         |<name> |<email>|<password>|<confirmPassword>|
    #     Then validation error message as "Please lengthen this text to 6 characters or more(you are currently using "<passwordLength>" characters)." should pop up
    #     Examples:
    #         |name|  email       |password|confirmPassword |passwordLength|
    #         |abc |abc@gmail.com |a       |a               |1              |
    #         |abc |abc@gmail.com |ab      |ab              |2              |
    #         |abc |abc@gmail.com |abc     |abc             |3              |
    #         |abc |abc@gmail.com |abc1    |abc1            |4              |
    #         |abc |abc@gmail.com |abc12   |abc12           |5              |