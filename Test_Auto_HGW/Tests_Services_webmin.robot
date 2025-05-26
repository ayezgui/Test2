*** Settings ***
Resource     ../Keywords/SeleniumKeywords.robot
Resource     ../Variables/HGW_variables.robot

*** Test Cases ***

Démarrer le service OpenVNC via Webmin
    [Documentation]    Ce cas de test vérifie que le service OpenVNC peut être démarré correctement via l'interface Webmin.
    Open a browser    ${WEBMIN_URL}    chrome
    Click Element   xpath://*[@id="details-button"]
    Click Element    xpath://*[@id="proceed-link"]
    Input Text Into Selector    id=user    ${USERNAME}
    Input Text Into Selector    name=pass    ${PASSWORD}
    Click Element    xpath://button[@type="submit"]
    Page Should Contain    Dashboard

    Click Element    xpath://*[@id="mCSB_4_container"]/ul/li[4]/a
    Click Element    xpath://*[@id="system"]/li[1]/a
    Wait Until Page Contains    Boot system : Systemd    timeout=60s

    # Sélectionner le service
    Click Element    xpath://*[@id="DataTables_Table_0"]/tbody/tr[215]/td[2]/a
    Wait Until Page Contains    Systemd service details    timeout=60s

    # Démarrer le service
    Click Element    xpath://*[@id="start_s_2"]
    Wait Until Page Contains    Starting service vncserver-virtuald.service ..    timeout=60s
    Click Element    xpath://*[@id="content"]/div/a
    Wait Until Page Contains    Current status    timeout=60s
    ${current_status}=    Get Text    xpath://*[@id="content"]/div/div/div[2]/form/div/table/tbody/tr/td/table/tbody/tr[5]
    Should Contain    ${current_status}    Running    
    Click Element    xpath://*[@id="content"]/div/div/div[2]/form/table/tbody/tr/td/div/button[1]
    Close a Browser
 Arrêter le service OpenVNC via Webmin
   [Documentation]    Ce cas de test vérifie que le service OpenVNC peut être arrêté correctement via l'interface Webmin.
    Open a browser    ${WEBMIN_URL}    chrome
    Click Element   xpath://*[@id="details-button"]
    Click Element    xpath://*[@id="proceed-link"]
    Input Text Into Selector    id=user    ${USERNAME}
    Input Text Into Selector    name=pass    ${PASSWORD}
    Click Element    xpath://button[@type="submit"]
    Page Should Contain    Dashboard

    Click Element    xpath://*[@id="mCSB_4_container"]/ul/li[4]/a
    Click Element    xpath://*[@id="system"]/li[1]/a
    Wait Until Page Contains    Boot system : Systemd    timeout=60s

    # Sélectionner le service
    Click Element    xpath://*[@id="DataTables_Table_0"]/tbody/tr[215]/td[2]/a
    Wait Until Page Contains    Systemd service details    timeout=60s

    # Arrêter le service
    Click Element    xpath://*[@id="stop_s_4"]
    Wait Until Page Contains    Stopping service vncserver-virtuald.service ..   timeout=60s
    Click Element    xpath://*[@id="content"]/div/a    
    Wait Until Page Contains    Current status    timeout=60s
    ${current_status}=    Get Text    xpath://*[@id="content"]/div/div/div[2]/form/div/table/tbody/tr/td/table/tbody/tr[5]
    Should Contain    ${current_status}    Not running    
    Click Element    xpath://*[@id="content"]/div/div/div[2]/form/table/tbody/tr/td/div/button[1]
    Close a Browser
    