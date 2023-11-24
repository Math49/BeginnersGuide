*** Keywords ***
the visitor is on "${url}" with playwright
    Browser.Open Browser    ${url}    chromium

the visitor log in to his account
    Fill Text    //*[@data-test="username"]    ${LOGIN}
    Fill Text    //*[@data-test="password"]    ${PWD}
    Click    //*[@data-test="login-button"]

the visitor clean his cart if it's not empty
    Sleep    5s
    @{get_count_elements}    Browser.Get Elements    //*[text()="Remove"]
    FOR    ${element}    IN    @{get_count_elements}
        #Log    ${element}
        #${attribute_by_element}    Get Attribute    ${element}    name
        #Log    ${element}
        Click    ${element}
    END

the visitor add the "${product_name}" product to cart
    Click    //img[@alt="${product_name}"]
    Click    //*[text()="Add to cart"]

the visitor go to his cart
    Click    //*[@id="shopping_cart_container"]/a

the product is in his cart
    ${article_is_visible}    Run Keyword And Return Status
    ...    Get Element States
    ...    //*[text()="Sauce Labs Backpackb"]
    ...    then
    ...    bool(value & visible)
    IF    '${article_is_visible}' == 'True'    Log    Element is visible

the visitor finalize his order
    Click    //*[@data-test="checkout"]
    Fill Text    //*[@data-test="firstName"]    Lucas
    Fill Text    //*[@data-test="lastName"]    Van Noort
    Fill Text    //*[@data-test="postalCode"]    49000
    Click    //*[@data-test="continue"]
    Click    //*[@data-test="finish"]

the order has been passed
    ${element_text}    Browser.Get Text    //*[text()="Thank you for your order!"]
    ${order_is_visible}    Run Keyword And Return Status
    ...    Should Be Equal
    ...    ${element_text}
    ...    Thank you for your order!
    IF    '${order_is_visible}' == 'True'    Log    Element is visible