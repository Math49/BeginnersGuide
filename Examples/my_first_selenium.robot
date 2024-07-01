*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${MESSAGE}    Lorem Ipsum
${VALUE_1}    10
${VALUE_2}    5


*** Test Cases ***
My Fisrt Selenium Robot Test
    [Tags]    my_first_selenium
    # Step 1 : aller sur le site https://demo.seleniumeasy.com/basic-first-form-demo.html
    Given the visitor go to "https://demo.seleniumeasy.com/basic-first-form-demo.html" on browser "chrome"
    # Step 2 : remplir le premier formulaire et vérifier le résultat
    When the visitor fills the first form 
    # Step 3 : remplir le deuxième formulaire et vérifier le résultat
    And the visitor fills the second form
    # Step 4 : contrôler les deux résultats avec les retours textuels visibles sur la page web
    Then all values are correctly sended


*** Keywords ***
the visitor go to "${url}" on browser "${browser}"
    Open Browser  ${url}  ${browser}

the visitor fills the first form
    Input Text  //input[@id="user-message"]  ${MESSAGE}
    Click Element  //button[text()="Show Message"]
    Element Should Contain  //*[@id="display"]  ${MESSAGE}

the visitor fills the second form
    Input Text  //*[@id="value1"]  ${VALUE_1}
    Input Text  //*[@id="value2"]  ${VALUE_2}
    Click Element  //button[text()="Get Total"]
    Element Should Contain  //*[@id="displayvalue"]  ${${VALUE_1}+${VALUE_2}}

all values are correctly sended
    ${excepted_message}=  Get Text  //*[@id="display"]
    ${excepted_value}=  Get Text  //*[@id="displayvalue"]
    Should Be Equal As Strings  ${excepted_message}  ${MESSAGE}
    Should Be Equal As Strings  ${excepted_value}  ${${VALUE_1}+${VALUE_2}}