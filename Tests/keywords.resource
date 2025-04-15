*** Settings ***
Library    SeleniumLibrary
Library    FakerLibrary

*** Variables ***
${URL}   https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${LOGIN_USERNAME}    Admin
${LOGIN_PASSWORD}    admin123

# user data
${USER_EMPLOYEE_NAME}    a
${USER_NAME}    testuser
${USER_ROLE}    ESS
${USER_STATUS}    Enabled
${USER_PASSWORD}    testpassword

# employee data
${EMPLOYEE_FIRST_NAME}    test
${EMPLOYEE_MIDDLE_NAME}    testmiddle
${EMPLOYEE_LAST_NAME}    employee
${EMPLOYEE_STATUS}    Enabled
${EMPLOYEE_PASSWORD}    testpassword
${EMPLOYEE_USERNAME}    testemployee

# elements
${EDIT_BUTTON}    xpath=//button/i[@class='oxd-icon bi-pencil-fill']
${DELETE_BUTTON}    xpath=//button/i[@class='oxd-icon bi-trash']
${DELETE_CONFIRM_BUTTON}    xpath=//button[contains(.,'Yes, Delete')]
${SUBMIT_BUTTON}   xpath=//button[@type='submit']
${FORM_INPUT_PASSWORD}        xpath=//label[text()='Password']/ancestor::div[contains(@class,'oxd-input-group')]//input
${FORM_INPUT_CONFIRM_PASSWORD}    xpath=//label[text()='Confirm Password']/ancestor::div[contains(@class,'oxd-input-group')]//input
${FORM_INPUT_USERNAME}            xpath=//label[text()='Username']/ancestor::div[contains(@class,'oxd-input-group')]//input

# login/logout elements
${LOGIN_INPUT_USERNAME}    xpath=//input[@name='username']
${LOGIN_INPUT_PASSWORD}    xpath=//input[@name='password']
${ACCOUNT_BUTTON}   xpath=//span[@class='oxd-userdropdown-tab']
${LOGOUT_BUTTON}   xpath=//a[text()='Logout']

# admin elements
${ADMIN_NAVIGATION}                 xpath=//a[.//span[contains(normalize-space(.), 'Admin')]]
${ADMIN_BUTTON_ADD}                xpath=//button[normalize-space(.)='Add']
${ADMIN_FORM_INPUT_ROLE}                xpath=//label[text()='User Role']/ancestor::div[contains(@class,'oxd-input-group')]//div[contains(@class,'oxd-select-text')]
${ADMIN_FORM_INPUT_STATUS}              xpath=//label[text()='Status']/ancestor::div[contains(@class,'oxd-input-group')]//div[contains(@class,'oxd-select-text')]
${ADMIN_FORM_INPUT_EMPLOYEE_NAME}       xpath=//label[text()='Employee Name']/ancestor::div[contains(@class,'oxd-input-group')]//input

# employee elements
${EMPLOYEE_NAVIGATION}                 xpath=//span[text()='PIM']/ancestor::a
${EMPLOYEE_BUTTON_ADD}                xpath=//button[normalize-space(.)='Add']
${EMPLOYEE_FORM_INPUT_FIRST_NAME}     xpath=//input[@name='firstName']
${EMPLOYEE_FORM_INPUT_MIDDLE_NAME}    xpath=//input[@name='middleName']
${EMPLOYEE_FORM_INPUT_LAST_NAME}      xpath=//input[@name='lastName']
${EMPLOYEE_FORM_INPUT_ID}              xpath=//label[text()='Employee Id']/ancestor::div[contains(@class,'oxd-input-group')]//input
${EMPLOYEE_CREATE_LOGIN_DETAILS}    xpath=//div[contains(@class,'user-form-header')]//span[contains(@class,'oxd-switch-input')]
${EMPLOYEE_FORM_INPUT_STATUS}         xpath=//label[text()='Status']/ancestor::div[contains(@class,'oxd-input-group')]//div[contains(@class,'--status-grouped-field')]

${EMPLOYEE_SEARCH_INPUT_NAME}    xpath=//label[text()='Employee Name']/ancestor::div[contains(@class,'oxd-input-group')]//input

*** Keywords ***
# Initialize data
Initialize Data Set
    ${USER_NAME}    FakerLibrary.UserName
    ${EMPLOYEE_USERNAME}    FakerLibrary.UserName

    ${EMPLOYEE_FIRST_NAME}    FakerLibrary.FirstName
    ${EMPLOYEE_MIDDLE_NAME}    FakerLibrary.FirstName
    ${EMPLOYEE_LAST_NAME}    FakerLibrary.LastName

    ${USER_PASSWORD}    FakerLibrary.Password
    ${EMPLOYEE_PASSWORD}    FakerLibrary.Password

    Set Test Variable    ${USER_NAME}
    Set Test Variable    ${EMPLOYEE_USERNAME}
    Set Test Variable    ${EMPLOYEE_FIRST_NAME}
    Set Test Variable    ${EMPLOYEE_MIDDLE_NAME}
    Set Test Variable    ${EMPLOYEE_LAST_NAME}
    Set Test Variable    ${USER_PASSWORD}
    Set Test Variable    ${EMPLOYEE_PASSWORD}

Click When Visible
    [Arguments]    ${locator}    ${timeout}=10s
    Wait Until Element Is Visible    ${locator}    timeout=${timeout}
    Click Element    ${locator}

# Go and login to the website
Login to Website
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Wait Until Element Is Visible    ${LOGIN_INPUT_USERNAME}     timeout=10s
    Input Text    ${LOGIN_INPUT_USERNAME}    ${LOGIN_USERNAME}
    Input Text    ${LOGIN_INPUT_PASSWORD}    ${LOGIN_PASSWORD}
    Click Button    ${SUBMIT_BUTTON}

# Click submit
Click submit button
    Click When Visible    ${SUBMIT_BUTTON}

# Enter username for create form
Enter username for create form
    [Arguments]    ${USERNAME}
    Input Text   ${FORM_INPUT_USERNAME}    ${USERNAME}

# Enter passwords for create form
Enter passwords for create form
    [Arguments]    ${PASSWORD}
    Input Text    ${FORM_INPUT_PASSWORD}    ${PASSWORD}
    Input Text    ${FORM_INPUT_CONFIRM_PASSWORD}    ${PASSWORD}

# Click edit button
Click edit button
    Click When Visible    ${EDIT_BUTTON}

# Click delete button
Click delete button
    Click When Visible    ${DELETE_BUTTON}
    Wait Until Element Is Visible    ${DELETE_CONFIRM_BUTTON}    timeout=10s
    Click When Visible    ${DELETE_CONFIRM_BUTTON}

# Logout
Logout
    Click When Visible    ${ACCOUNT_BUTTON}
    Click When Visible    ${LOGOUT_BUTTON}
    Wait Until Element Is Visible    ${LOGIN_INPUT_USERNAME}    timeout=10s
    Page Should Contain Element    ${LOGIN_INPUT_USERNAME}