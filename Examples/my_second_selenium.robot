*** Settings ***
Resource    common.robot


*** Variables ***
${Firstname}        Lucas
${Lastname}         VAN NOORT
${Email}            contact@acodyme.com
${Message}          Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
${Contact_Link}     //*[@id="menu-item-25"]/a/span[text()=
${Contact_Form}     //*[@id="post-24"]//form


*** Test Cases ***
My Second Selenium Robot Test
    [Tags]    my_second_selenium
    # Step 1 : aller sur le site https://thedemosite.co.uk/
    Given the visitor is on "https://thedemosite.co.uk/"
    # Step 2 : cliquer dans le menu sur la page "Contact"
    When the visitor clicks on "Contact" link menu
    # Step 3 : vérifier que le formulaire (element <form/>) est présent dans le DOM HTML
    And the visitor checks the form is in the page
    # Step 4 : remplir le formulaire de contact (prendre en compte le nombre de champs à remplir)
    And the visitor fill the form
    # Step 5 : soumettre le formulaire de contact
    And the visitor submit his form
    # Step 6 : vérifier que le formulaire a bien été envoyé
    Then the form is corretly submitted