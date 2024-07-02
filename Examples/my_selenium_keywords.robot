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

the visitor select the "${day}" option from the select days
    Select From List By Value  //select[@id="select-demo"]  ${day}

#the visitor select these options "New York, Texas" from the select cities
the visitor select these options "${cities}" from the select cities
    @{cities}=  Split String  ${cities}  ,
    ${city_1}=  Get From List  ${cities}  0
    ${city_2}=  Get From List  ${cities}  1
    Select From List By Label  //select[@id="multi-select"]  ${city_1}  ${city_2}
    Click Element  //button[@id="printAll"]

the selected day is "${day}" displayed
    Wait Until Element Contains  //p[@class="selected-value"]  ${day}

the selected cities are "${cities}" displayed
    Wait Until Element Contains  //p[@class="getall-selected"]  ${cities}
