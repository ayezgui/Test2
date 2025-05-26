*** Settings ***
Library    SeleniumLibrary

   
*** Variables ***
${TIMEOUT}      30 seconds
 
*** Keywords ***
Open a browser
    [Arguments]    ${url}    ${browser}
    Open Browser    ${url}    ${browser}
    Maximize Browser Window

Go To URL
    [Arguments]    ${url}
    Go To    ${url}

#Click_Element
   #[Arguments]    ${locator}
   #Wait Until Element Is Visible    ${locator}    ${TIMEOUT}
    #Click Element    ${locator}
Verify Element Exists
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}    ${TIMEOUT}
    Page Should Contain Element    ${locator}
    
Verify Element Does Not Exist
    [Arguments]    ${locator}
    Wait Until Element Is Not Visible    ${locator}    ${TIMEOUT}
    Page Should Not Contain Element    ${locator}

Input Text Into Selector
    [Arguments]    ${locator}    ${text}
    Wait Until Element Is Visible    ${locator}    ${TIMEOUT}
    Input Text    ${locator}    ${text}
Get Text From Selector
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}    ${TIMEOUT}
    ${text}    Get Text    ${locator}
    [Return]    ${text}
Double Click Element
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}    ${TIMEOUT}
    Double Click Element    ${locator}
Clear Text
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}    ${TIMEOUT}
    Clear Element Text    ${locator}
Close a Browser
    Close Browser
Close Browsers
    Close All Browsers

Selecting Radio Button
    [Arguments]    ${group}    ${value}
    Wait Until Element Is Visible    ${group}    ${TIMEOUT}
    Select Radio Button    ${group}    ${value}

Selecting Checkbox
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}    ${TIMEOUT}
    Select Checkbox    ${locator}

Right Click Element
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}    ${TIMEOUT}
    Open Context Menu    ${locator}

Drag and Drop
    [Arguments]    ${source}    ${target}
    Wait Until Element Is Visible    ${source}    ${TIMEOUT}
    Wait Until Element Is Visible    ${target}    ${TIMEOUT}
    Drag And Drop    ${source}    ${target}

Take Screenshot
    [Arguments]    ${filename}
    Capture Page Screenshot    ${filename}

Capture Element Screenshot
    [Arguments]    ${locator}    ${filename}
    Wait Until Element Is Visible    ${locator}    ${TIMEOUT}
    Capture Element Screenshot    ${locator}    ${filename}

Move Element (mouse down/up)
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}    ${TIMEOUT}
    Mouse Down    ${locator}
    Sleep    1s 
    Mouse Up    ${locator}




