*** Settings ***
Library    SeleniumLibrary
Resource    keywords.resource
Suite Setup    Login to Website
Suite Teardown    Close Browser
Test Tags    tnr

*** Test Cases ***
Test User Manager

    [Tags]    tnr
    Initialize Data Set
    Create User
    Search User
    Edit User
    Delete User
    Logout


*** Keywords ***
Create User

    Admin Navigation
    Wait Until Element Is Visible    ${ADMIN_BUTTON_ADD}     timeout=10s
    Click Element    ${ADMIN_BUTTON_ADD}
    Wait Until Element Is Visible    ${ADMIN_FORM_INPUT_ROLE}     timeout=10s
    Click Element    ${ADMIN_FORM_INPUT_ROLE}
    Wait Until Element Is Visible    ${ADMIN_FORM_DROPDOWN_THIRD_ELEMENT}    timeout=5s
    Click Element    ${ADMIN_FORM_DROPDOWN_THIRD_ELEMENT}

    Click Element    ${ADMIN_FORM_INPUT_STATUS}
    Wait Until Element Is Visible    ${ADMIN_FORM_DROPDOWN_SECOND_ELEMENT}    timeout=5s
    Click Element    ${ADMIN_FORM_DROPDOWN_SECOND_ELEMENT}

    Input Text       ${ADMIN_FORM_INPUT_EMPLOYEE_NAME}    ${USER_EMPLOYEE_NAME}
    Wait Until Element Is Visible    ${ADMIN_FORM_DROPDOWN_THIRD_ELEMENT}    timeout=5s
    Click Element    ${ADMIN_FORM_DROPDOWN_THIRD_ELEMENT}
    Enter username for create form    ${USER_NAME}
    Enter passwords for create form   ${USER_PASSWORD}
    Click submit button

Search User
    Admin Navigation
    Wait Until Element Is Visible    ${ADMIN_FORM_INPUT_EMPLOYEE_NAME}    timeout=10s
    Do Search
    Page Should Contain    Records Found

Edit User
    Click edit button
    Wait Until Element Is Visible    ${FORM_INPUT_USERNAME}    timeout=10s
    Input Text       ${FORM_INPUT_USERNAME}    testtt
    Click submit button

Delete User
    Admin Navigation
    Wait Until Element Is Visible    ${ADMIN_FORM_INPUT_EMPLOYEE_NAME}    timeout=10s
    Do Search
    Click delete button
    Wait Until Element Is Visible    ${ADMIN_FORM_INPUT_EMPLOYEE_NAME}    timeout=10s

Do Search
    Click Element    ${ADMIN_FORM_INPUT_ROLE}
    Wait Until Element Is Visible    ${ADMIN_FORM_DROPDOWN_THIRD_ELEMENT}    timeout=5s
    Click Element    ${ADMIN_FORM_DROPDOWN_THIRD_ELEMENT}
    Click submit button
    Sleep    2s

Admin Navigation
    Wait Until Element Is Visible    ${ADMIN_NAVIGATION}     timeout=10s
    Click Element    ${ADMIN_NAVIGATION}