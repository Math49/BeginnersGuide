*** Settings ***
Documentation     Teste la gestion des employés sur OrangeHRM : ajout, recherche, modification, suppression, déconnexion.
Resource          keywords.resource
Suite Setup       Login to Website
Suite Teardown    Close Browser
Test Tags         tnr

*** Test Cases ***
Gestion des employés - Ajouter, Modifier, Supprimer
    [Tags]    tnr
    Aller sur la page PIM
    Ajouter un employé avec login
    Aller sur la page PIM
    Rechercher l’employé
    Modifier les infos de l’employé
    Aller sur la page PIM
    Supprimer l’employé
    Déconnexion

*** Keywords ***
Aller sur la page PIM
    Click When Visible    ${EMPLOYEE_NAVIGATION}

Ajouter un employé avec login
    Initialize Data Set
    Click When Visible    ${EMPLOYEE_BUTTON_ADD}
    Wait Until Element Is Visible    xpath=//h6[text()='Add Employee']    10s 
    Input Text    ${EMPLOYEE_FORM_INPUT_FIRST_NAME}    ${EMPLOYEE_FIRST_NAME}
    Input Text    ${EMPLOYEE_FORM_INPUT_MIDDLE_NAME}   ${EMPLOYEE_MIDDLE_NAME}
    Input Text    ${EMPLOYEE_FORM_INPUT_LAST_NAME}     ${EMPLOYEE_LAST_NAME}
    Click When Visible    ${EMPLOYEE_CREATE_LOGIN_DETAILS}
    Enter username for create form    ${EMPLOYEE_USERNAME}
    Enter passwords for create form   ${EMPLOYEE_PASSWORD}
    Click When Visible    ${SUBMIT_BUTTON}
    Wait Until Element Is Visible    xpath=//h6[text()='${EMPLOYEE_FIRST_NAME} ${EMPLOYEE_LAST_NAME}']    10s

Rechercher l’employé
    Wait Until Element Is Visible    ${EMPLOYEE_SEARCH_INPUT_NAME}    10s
    Input Text    ${EMPLOYEE_SEARCH_INPUT_NAME}    a
    Sleep    3s
    Press Keys    ${EMPLOYEE_SEARCH_INPUT_NAME}    ARROW_DOWN
    Press Keys    ${EMPLOYEE_SEARCH_INPUT_NAME}    ENTER
    Click When Visible    ${SUBMIT_BUTTON}
    Click When Visible    ${EDIT_BUTTON}

Modifier les infos de l’employé
    SeleniumLibrary.Wait Until Element Is Visible    xpath=//h6[text()='Personal Details']    10s
    Input Text    ${EMPLOYEE_FORM_INPUT_MIDDLE_NAME}    Modifié
    Click When Visible    ${SUBMIT_BUTTON}

Supprimer l’employé
    Click delete button

Déconnexion
    Logout