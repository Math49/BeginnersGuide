*** Settings ***
Library                             Browser

*** Variables ***
${LOGIN}  standard_user
${PWD}    secret_sauce

*** Test Cases ***
My Fisrt Playwright Robot Test
    [Tags]  my_first_playwright
    # Step 1 : aller sur le site https://www.saucedemo.com/
    Given the visitor is on "https://www.saucedemo.com/"
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

*** Keywords ***
the visitor is on "${url}"
    Open Browser  ${url}  chromium

the visitor log in to his account
    Fill Text  //*[@data-test="username"]  ${LOGIN}
    Fill Text  //*[@data-test="password"]  ${PWD}
    Click  //*[@data-test="login-button"]

the visitor clean his cart if it's not empty
    Sleep  10s
    ${get_count_elements}    Get Element Count    //*[text()="Remove"]
    FOR    ${number}    IN RANGE    ${get_count_elements}
        Click    //*[text()="Remove"]
    END

the visitor add the "${product_name}" product to cart
    Click  //img[@alt="${product_name}"]
    Click  //*[text()="Add to cart"]

the visitor go to his cart
    Click  //*[@id="shopping_cart_container"]/a

the product is in his cart
    ${article_is_visible}    Run Keyword And Return Status    Get Element States    //*[text()="Sauce Labs Backpackb"]    then    bool(value & visible)
    Run Keyword If    '${article_is_visible}' == 'True'    Log    Element is visible

the visitor finalize his order
    Click  //*[@data-test="checkout"]
    Fill Text  //*[@data-test="firstName"]  Lucas
    Fill Text  //*[@data-test="lastName"]  Van Noort
    Fill Text  //*[@data-test="postalCode"]  49000
    Click  //*[@data-test="continue"]
    Click  //*[@data-test="finish"]

the order has been passed
    ${order_is_visible}    Run Keyword And Return Status    Get Element States    //*[text()="Sauce Labs Backpackb"]    then    bool(value & visible)
    Run Keyword If    '${order_is_visible}' == 'True'    Log    Element is visible