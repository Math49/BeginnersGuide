*** Settings ***
Resource    common.robot


*** Variables ***
${LOGIN}    standard_user
${PWD}      secret_sauce


*** Test Cases ***
My Fisrt Playwright Robot Test
    [Tags]    my_first_playwright
    # Step 1 : aller sur le site https://www.saucedemo.com/
    Given the visitor is on "https://www.saucedemo.com/" with playwright
    # Step 2 : se connecter au compte standard_user
    And the visitor log in to his account
    # Step 3 : vider le panier (avec le bouton "Remove", s’il est visibile sur la grille produit
    And the visitor clean his cart if it's not empty
    # Step 4 : ajouter la produit "Sauce Labs Backpack" au panier
    And the visitor add the "Sauce Labs Backpack" product to cart
    # Step 5 : aller dans le panier
    When the visitor go to his cart
    # Step 6 : vérifier que le produit "Sauce Labs Backpack" est présent dans le panier
    Then the product is in his cart
    # Step 7 : continuer le processus de commande
    And the visitor finalize his order
    # Step 9 : vérifier que la commande est validée grâce au message "Thank you for your order"
    And the order has been passed