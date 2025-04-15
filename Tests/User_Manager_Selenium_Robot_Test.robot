*** Settings ***
Library    SeleniumLibrary
Resource    keywords.resource

*** Test Cases ***

Test Case 1: Create User
    [Tags]    create    tnr
    Initialize Data Set
    Login to Website
    Wait Until Element Is Visible    ${ADMIN_NAVIGATION}     timeout=10s
    Click Element    ${ADMIN_NAVIGATION}
    Wait Until Element Is Visible    ${ADMIN_BUTTON_ADD}     timeout=10s
    Click Element    ${ADMIN_BUTTON_ADD}
    Click Element    ${ADMIN_FORM_INPUT_ROLE}
    Click Element    xpath=//div[@role="option" and normalize-space(text())='${USER_ROLE}']
    Click Element    ${ADMIN_FORM_INPUT_STATUS}
    Click Element    xpath=//div[@role="option" and normalize-space(text())='${USER_STATUS}']
    Input Text       ${ADMIN_FORM_INPUT_EMPLOYEE_NAME}    ${EMPLOYEE_FIRST_NAME} ${EMPLOYEE_LAST_NAME}
    Enter username for create form    ${USER_NAME}
    Enter passwords for create form   ${USER_PASSWORD}
    Click submit button
    Logout

Test Case 2: Search User
    [Tags]    search    tnr
    Login to Website
    Wait Until Element Is Visible    ${ADMIN_NAVIGATION}     timeout=10s
    Click Element    ${ADMIN_NAVIGATION}
    Wait Until Element Is Visible    ${ADMIN_FORM_INPUT_EMPLOYEE_NAME}    timeout=10s
    Input Text       ${ADMIN_FORM_INPUT_EMPLOYEE_NAME}    ${EMPLOYEE_FIRST_NAME} ${EMPLOYEE_LAST_NAME}
    Click submit button
    Page Should Contain    ${USER_NAME}
    Logout

Test Case 3: Edit User
    [Tags]    edit    tnr
    Login to Website
    Wait Until Element Is Visible    ${ADMIN_NAVIGATION}     timeout=10s
    Click Element    ${ADMIN_NAVIGATION}
    Wait Until Element Is Visible    ${ADMIN_FORM_INPUT_EMPLOYEE_NAME}    timeout=10s
    Input Text       ${ADMIN_FORM_INPUT_EMPLOYEE_NAME}    ${EMPLOYEE_FIRST_NAME} ${EMPLOYEE_LAST_NAME}
    Click submit button
    Click edit button
    Enter passwords for create form   ${USER_PASSWORD}
    Click submit button
    Logout

Test Case 4: Delete User
    [Tags]    delete    tnr
    Login to Website
    Wait Until Element Is Visible    ${ADMIN_NAVIGATION}     timeout=10s
    Click Element    ${ADMIN_NAVIGATION}
    Wait Until Element Is Visible    ${ADMIN_FORM_INPUT_EMPLOYEE_NAME}    timeout=10s
    Input Text       ${ADMIN_FORM_INPUT_EMPLOYEE_NAME}    ${EMPLOYEE_FIRST_NAME} ${EMPLOYEE_LAST_NAME}
    Click submit button
    Click delete button
    Page Should Not Contain    ${USER_NAME}
    Logout
