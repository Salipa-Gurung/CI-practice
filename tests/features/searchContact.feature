Feature: Search contact
    As a user
    I want to search contact by contact name
    So that only searched contact is displayed in contact list

    Background:
        Given the User has logged in and navigated to Contact Fox page
        And the following contacts has been created 
            |name|email        |phone     |contact-type|
            |abc |abc@gmail.com|9898989898|personal    |
            |xyz |xyz@gmail.com|9876543210|personal    | 
            |Ram |ram@gmail.com|9801234567|professional|
            |Hari|hari@yahoo.com|9801234567|professional|

    Scenario Outline: Search contact with contact name
        When User search contact with contact name "<name>"
        Then contact with name "<name>" should only be displayed in contact list
        Examples:
            |name|
            |abc |
            |xyz |
            |Ram |
            |Hari|

    Scenario Outline: Search contact by email
        When User search contact with contact email "<email>"
        Then contact with email "<email>" should only be displayed in contact list
        Examples:
            |email        |
            |abc@gmail.com|
            |xyz@gmail.com|
            |ram@gmail.com|
            |hari@yahoo.com|

    Scenario Outline: Search contact with string input
        When User search contact with string input "<inputData>"
        Then contacts which contains "<inputData>" in contact name or in email should be displayed in contact list
        Examples:
            |inputData|
            |g        |
            |y        |
            |ram      |
            |b        |