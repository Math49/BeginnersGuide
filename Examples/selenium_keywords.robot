*** Keywords ***
the visitor is on "${url}"
    SeleniumLibrary.Open Browser    ${url}    chrome
    Capture Page Screenshot

the visitor clicks on the first article
    ${article_is_visible}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${first_article}
    IF    ${article_is_visible}
        Click Element    ${first_article}
        Capture Page Screenshot
    END

we count the numbers of "${terms}" occurencies is higher than 10
    ${count_terms}=    SeleniumLibrary.Get Element Count    //*[contains(text(),"${terms}")]
    Should Be True    ${count_terms} > 10

we can see "${numbers}" related posts
    Scroll Element Into View    //*[@class='ast-single-related-posts-container']
    ${get_count_articles}=    SeleniumLibrary.Get Element Count
    ...    //*[@class='ast-single-related-posts-container']//article
    Should Be True    ${get_count_articles} == 2

the visitor clicks on "${name_menu_link}" link menu
    # Sleep    4s
    ${contact_link_is_visible}=    Run Keyword And Return Status
    ...    Wait Until Element Is Visible
    ...    ${Contact_Link}"${name_menu_link}"]
    IF    ${contact_link_is_visible}
        Click Element    ${Contact_Link}"${name_menu_link}"]
        Capture Page Screenshot
    END

the visitor checks the form is in the page
    Wait Until Element Is Visible    ${Contact_Form}    10s

the visitor fill the form
    Input Text    //*[@autocomplete="given-name"]    ${Firstname}
    Input Text    //*[@autocomplete="family-name"]    ${Lastname}
    Input Text    //*[@autocomplete="email"]    ${Email}
    Input Text    //textarea    ${Message}
    Capture Page Screenshot

the visitor submit his form
    Click Button    //*[@id="post-24"]/div/div/form/div/button
    # Sleep    4s

the form is corretly submitted
    Page Should Contain    The form has been submitted successfully!
    Capture Page Screenshot
