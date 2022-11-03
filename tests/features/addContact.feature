Feature: Add new contact
    As a user
    I want to add contact 
    So that it will be displayed in contact list

    Background:
        Given User has logged in and navigated to Contact Fox page

    Scenario Outline: Add contact with name, email, contact type and with or without phone number
        When user enters name as "<name>", email as "<email>", phone as "<phone>" and contact type as "<contact-type>"
        Then contact with name as "<name>", email as "<email>", phone as "<phone>" and contact type as "<contact-type>" should be displayed in contact list
        Examples:
            |name|  email      |    phone |contact-type|
            |abc |abc@gmail.com|9801234567|personal    |
            |xyz |xyz@gmail.com|9874561230|professional|
          
    # Scenario Outline: Add contact without full details
    #     When user enters name as "<name>", email as "<email>" and contact type as "<contact-type>"
    #     Then contact with name as "<name>", email as "<email>" and contact type as "<contact-type>" should not be created 
    #     Examples:
    #         |name|  email      |contact-type|
    #         |    |abc@gmail.com|personal    |
    #         |    |abc@gmail.com|professional|
    #         |abc |             |personal    |
    #         |abc |             |professional|
    #         |    |             |personal    |
    #         |    |             |professional|

    Scenario: Adding contact with incorrect email format
        When User adds contact with following details
            |name|  email     | phone    |contact-type|
            |abc |abcgmail.com|9801234567|personal    |
        Then validation error message as "Please include an '@' in the email address.'abcgmail.com' is missing '@'." should pop up in the input field