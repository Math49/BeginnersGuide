*** Settings ***
Library     Browser
Library     String


*** Variables ***
${URL}      https://opensource-demo.orangehrmlive.com/web/index.php/auth/login


*** Test Cases ***
User Managment Playwright Robot Test
    [Tags]    user_managment_playwright
    Given the visitor is connected on "${URL}" website
    And the visitor create new user
    And the visitor find his new user
    When the visitor has modified his new user
    And the visitor find his new user
    Then the visitor delete his modified user


*** Keywords ***
the visitor is connected on "${url}" website
    Open Browser    ${url}    chromium
    # Wait For Condition    return document.readyState == "complete"    10s
    Wait Until Page Contains Element    //*[@id="app"]/div[1]
    Fill Text    //input[@name="username"]    Admin
    Fill Text    //input[@name="password"]    admin123
    Click    //button[@type="submit"]

the visitor create new user
    Click    //span[text()="Admin"]
    Click    //button[text()=" Add "]
    click and select the good value
    Sleep    10s

click and select the good value
    ${username}    Generate Random String    10    [LETTERS]
    Set Test Variable    ${username.replace('"', '')}
    Browser.Press Keys    (//div[@class="oxd-select-text-input"])[1]    ArrowDown    ArrowDown    Enter
    Browser.Press Keys    (//div[@class="oxd-select-text-input"])[2]    ArrowDown    Enter
    Fill Text    //label[text()="Password"]/following::input[1]    azerty123
    Browser.Press Keys    //*[@placeholder="Type for hints..."]    a
    Sleep    3s
    Browser.Press Keys    //*[@placeholder="Type for hints..."]    ArrowDown    Enter
    Fill Text    //label[text()="Username"]/following::input[1]    ${username}
    Fill Text    //label[text()="Confirm Password"]/following::input[1]    azerty123
    Click    //button[text()=" Save "]

the visitor find his new user
    Fill Text    //label[text()="Username"]/following::input[1]    ${username}
    Click    //button[text()=" Search "]
    Sleep    4s

the visitor has modified his new user
    Set Test Variable    ${username}    ${username}123
    Sleep    2s
    Click    //button[i[contains(@class, "oxd-icon") and contains(@class, "bi-pencil-fill")]]
    Fill Text    //label[text()="Username"]/following::input[1]    ${username}
    Click    //button[text()=" Save "]
    Sleep    6s

the visitor delete his modified user
    Click    //button[i[contains(@class, "oxd-icon") and contains(@class, "bi-trash")]]
    Click    //button[text()=" Yes, Delete "]
