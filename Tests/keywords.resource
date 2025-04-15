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
${DELETE_CONFIRM_BUTTON}    xpath=//button[text()='Yes, Delete']
${SUBMIT_BUTTON}   xpath=//button[@type='submit']

# login elements
${LOGIN_INPUT_USERNAME}    xpath=//input[@name='username']
${LOGIN_INPUT_PASSWORD}    xpath=//input[@name='password']

# admin elements
${ADMIN_NAVIGATION}                 xpath=//span[text()='Admin']/ancestor::a
${ADMIN_BUTTON_ADD}                xpath=//button[normalize-space(.)='Add']
${ADMIN_FORM_INPUT_ROLE}                xpath=//label[text()='User Role']/ancestor::div[contains(@class,'oxd-input-group')]//div[contains(@class,'oxd-select-text')]
${ADMIN_FORM_INPUT_STATUS}              xpath=//label[text()='Status']/ancestor::div[contains(@class,'oxd-input-group')]//div[contains(@class,'oxd-select-text')]
${ADMIN_FORM_INPUT_EMPLOYEE_NAME}       xpath=//label[text()='Employee Name']/ancestor::div[contains(@class,'oxd-input-group')]//input
${ADMIN_FORM_INPUT_USERNAME}            xpath=//label[text()='Username']/ancestor::div[contains(@class,'oxd-input-group')]//input
${ADMIN_FORM_INPUT_PASSWORD}            xpath=//label[text()='Password']/ancestor::div[contains(@class,'oxd-input-group')]//input
${ADMIN_FORM_INPUT_CONFIRM_PASSWORD}    xpath=//label[text()='Confirm Password']/ancestor::div[contains(@class,'oxd-input-group')]//input

${ADMIN_SEARCH_INPUT_USERNAME}    xpath=//label[text()='Username']/ancestor::div[contains(@class,'oxd-input-group')]//input

# employee elements
${EMPLOYEE_NAVIGATION}                 xpath=//span[text()='PIM']/ancestor::a
${EMPLOYEE_BUTTON_ADD}                xpath=//button[normalize-space(.)='Add']
${EMPLOYEE_FORM_INPUT_FIRST_NAME}       xpath=//label[text()='First Name']/ancestor::div[contains(@class,'oxd-input-group')]//input
${EMPLOYEE_FORM_INPUT_MIDDLE_NAME}      xpath=//label[text()='Middle Name']/ancestor::div[contains(@class,'oxd-input-group')]//input
${EMPLOYEE_FORM_INPUT_LAST_NAME}        xpath=//label[text()='Last Name']/ancestor::div[contains(@class,'oxd-input-group')]//input
${EMPLOYEE_FORM_INPUT_ID}              xpath=//label[text()='Employee Id']/ancestor::div[contains(@class,'oxd-input-group')]//input
${EMPLOYEE_CREATE_LOGIN_DETAILS}       xpath=//p[text()='Create Login Details']/ancestor::div[contains(@class,'user-form-header')]//div[contains(@class, 'oxd-switch-wrapper')]//input
${EMPLOYEE_FORM_INPUT_USERNAME}       xpath=//label[text()='Username']/ancestor::div[contains(@class,'oxd-input-group')]//input
${EMPLOYEE_FORM_INPUT_STATUS}         xpath=//label[text()='Status']/ancestor::div[contains(@class,'oxd-input-group')]//div[contains(@class,'--status-grouped-field')]
${EMPLOYEE_FORM_INPUT_PASSWORD}        xpath=//label[text()='Password']/ancestor::div[contains(@class,'oxd-input-group')]//input
${EMPLOYEE_FORM_INPUT_CONFIRM_PASSWORD}    xpath=//label[text()='Confirm Password']/ancestor::div[contains(@class,'oxd-input-group')]//input

${EMPLOYEE_SEARCH_INPUT_NAME}    xpath=//label[text()='Employee Name']/ancestor::div[contains(@class,'oxd-input-group')]//input

*** Keywords ***
# Initialize data
Initialize Data Set
    ${USER_PASSWORD}    FakerLibrary.Password
    ${USER_NAME}    FakerLibrary.UserName
    ${EMPLOYEE_FIRST_NAME}    FakerLibrary.FirstName
    ${EMPLOYEE_MIDDLE_NAME}    FakerLibrary.FirstName
    ${EMPLOYEE_LAST_NAME}    FakerLibrary.LastName
    ${EMPLOYEE_USERNAME}    FakerLibrary.UserName
    ${EMPLOYEE_PASSWORD}    FakerLibrary.Password

# Go and login to the website

# Click submit
Click submit button
    Click Element    ${SUBMIT_BUTTON}

# Enter username for create form

# Enter passwords for create form

# Click edit button
Click edit button
    Click Element    ${EDIT_BUTTON}

# Click delete button
Click delete button
    Click Element    ${DELETE_BUTTON}

# Logout