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
    Login to Website
    Create User
    Search User
    Edit User
    Delete User
    Logout


*** Keywords ***
Create User

    Wait Until Element Is Visible    ${ADMIN_NAVIGATION}     timeout=10s
    Click Element    ${ADMIN_NAVIGATION}
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
    Wait Until Element Is Visible    ${ADMIN_NAVIGATION}     timeout=10s
    Click Element    ${ADMIN_NAVIGATION}
    Wait Until Element Is Visible    ${ADMIN_FORM_INPUT_EMPLOYEE_NAME}    timeout=10s
    Click Element    ${ADMIN_FORM_INPUT_ROLE}
    Wait Until Element Is Visible    ${ADMIN_FORM_DROPDOWN_THIRD_ELEMENT}    timeout=5s
    Click Element    ${ADMIN_FORM_DROPDOWN_THIRD_ELEMENT}
    Click submit button
    Sleep    2s
    Page Should Contain    Records Found

Edit User
    Wait Until Element Is Visible    ${ADMIN_NAVIGATION}     timeout=10s
    Click Element    ${ADMIN_NAVIGATION}
    Wait Until Element Is Visible    ${ADMIN_FORM_INPUT_EMPLOYEE_NAME}    timeout=10s
    Click edit button
    Enter passwords for create form   ${USER_PASSWORD}
    Click submit button

Delete User
    Wait Until Element Is Visible    ${ADMIN_NAVIGATION}     timeout=10s
    Click Element    ${ADMIN_NAVIGATION}
    Wait Until Element Is Visible    ${ADMIN_FORM_INPUT_EMPLOYEE_NAME}    timeout=10s
    Input Text       ${ADMIN_FORM_INPUT_EMPLOYEE_NAME}    ${EMPLOYEE_FIRST_NAME} ${EMPLOYEE_LAST_NAME}
    Click submit button
    Click delete button
    Page Should Not Contain    ${USER_NAME}
