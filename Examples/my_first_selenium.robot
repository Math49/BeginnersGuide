*** Settings ***
Library     SeleniumLibrary
Resource    my_selenium_keywords.robot

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
