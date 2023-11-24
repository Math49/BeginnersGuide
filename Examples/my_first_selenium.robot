*** Settings ***
Resource    common.robot


*** Variables ***
${first_article}    //article[1]


*** Test Cases ***
My Fisrt Selenium Robot Test
    [Tags]    my_first_selenium
    # Step 1 : aller sur le site https://thedemosite.co.uk/
    Given the visitor is on "https://thedemosite.co.uk/"
    # Step 2 : cliquer sur le premier article de la page d'accueil
    When the visitor clicks on the first article
    # Step 3 : vérifier que le termes "provider" est bien présent plus de 10 fois dans la page
    And we count the numbers of "provider" occurencies is higher than 10
    # Step 4 : vérifier qu'il y a bien deux blocs related posts
    Then we can see "2" related posts