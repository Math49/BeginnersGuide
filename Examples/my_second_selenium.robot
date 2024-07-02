*** Settings ***
Library     SeleniumLibrary
Library     String
Library     Collections
Resource    my_selenium_keywords.robot


*** Variables ***
${OPTION_1}     value
${OPTION_2}     value


*** Test Cases ***
Demo Selenium Easy Select Dropdown List
    [Tags]    my_second_selenium
    # Step 1 : aller sur le site https://demo.seleniumeasy.com/basic-select-dropdown-demo.html 
    Given the visitor go to "https://demo.seleniumeasy.com/basic-select-dropdown-demo.html" on browser "chrome"
    # Step 2 : dans la liste simple sélectionnez le jour « Monday »
    When the visitor select the "Monday" option from the select days
    # Step 3 : dans la liste à choix multiple sélectionnez les villes « New York » et « Texas »
    And the visitor select these options "New York,Texas" from the select cities
    # Step 4 : contrôler dans les champs de retours sur la page web les valeurs sélectionnées
    Then the selected day is "Monday" displayed
    And the selected cities are "Texas" displayed