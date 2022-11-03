Feature: Edit contact
    As a user 
    I want to edit already existing contact
    So that edited contact is updated and displayed in contact list

    Background:
        Given the user has logged in and navigated to Contact Fox page 

    Scenario: Edit a user's new data
        Given a contact has been created with following details
            |name|email        |phone     |contact-type|
            |abc |abc@gmail.com|9898989898|personal    |
        And selects contact with email "abc@gmail.com" to edit
        When user edits contact with new data 
            |name   |   email        |phone     |contact-type|
            |abcdef |abcdef@gmail.com|9898989898|personal    |
        Then contact with email "abcdef@gmail.com" should be updated with new data as 
            |name   |   email           |phone     |contact-type|
            |abcdef |abcdef@gmail.com      |9898989898|personal    |

    Scenario: Edit a specific contact from contact list
        Given contacts have been added with following credentials
            |name|email        |phone     |contact-type|
            |abc |abc@gmail.com|9898989898|personal    |
            |def |def@gmail.com|9797979797|personal    |
            |ijk |ijk@gmail.com|9876543210|professional|
            |xyz |xyz@gmail.com|9801234567|professional|
        And the user selects contact with email "ijk@gmail.com" to edit
        When user edits contact with new data 
            |name   |   email        |phone     |contact-type|
            |abcdef |abcdef@gmail.com|9898989898|personal    |
        Then contact with email "abcdef@gmail.com" should be updated with new data as 
            |name   |   email        |phone     |contact-type|
            |abcdef |abcdef@gmail.com|9898989898|personal    |

    # Scenario: Edit name only
    #     When User edits name as "John Doe" and updates contact
    #     Then Contact name should be updated

    # Scenario: Edit email only
    #     When User edits email as "john@gmail.com" and updates contact
    #     Then Contact email should be updated

    # Scenario: Edit phone number only
    #     When User edits phone as "9800000000" and updates contact
    #     Then Contact phone should be updated

    # Scenario: Edit contact type only
    #     When User edits contact type 
    #     Then Contact type should be updated

    # Scenario: Edit all fields
    #     When User edits all the fields 
    #     Then Contact should be updated with new data

    # Scenario: Edit email with invalid format
    #     When User edits email to "abcgmail.com"
    #     Then validation error message as "Please include an '@' in the email address." should pop up

    # Scenario: Edit contact details with empty input fields
    #     When User updates contact by removes all data from input fields
    #     Then Contact should not update with empty input field 
