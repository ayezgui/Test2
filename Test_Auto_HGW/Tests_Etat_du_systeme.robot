*** Settings ***
Resource     ../Keywords/SeleniumKeywords.robot
Resource     ../Variables/HGW_variables.robot

*** Test Cases ***
Vérifier l'État du Système 
    [Documentation]    Ce cas de test vérifie que les informations sur l'état du système sont correctement récupérées depuis webmin et respectent les seuils définis
   
    Open a browser    ${WEBMIN_URL}    chrome
    Click Element    xpath://*[@id="details-button"]
    Click Element    xpath://*[@id="proceed-link"]
    Input Text Into Selector    id=user    ${USERNAME}
    Input Text Into Selector    name=pass    ${PASSWORD}
    Click Element    xpath://button[@type="submit"]
    Page Should Contain    Dashboard

    #  Récupérer les valeurs brutes (CPU, mémoire, disque)
    ${cpu_raw}=    Get Text From Selector    xpath://*[@id="system-status"]/div[2]/div[1]/div[1]/span
    ${memory_raw}=    Get Text From Selector    xpath://*[@id="system-status"]/div[2]/div[1]/div[2]/span
    ${disk_raw}=    Get Text From Selector    xpath://*[@id="system-status"]/div[2]/div[1]/div[4]/span


    # Nettoyer les chaînes pour extraire uniquement les parties numériques
    ${cpu_clean}=    Evaluate    "".join(filter(str.isdigit, """${cpu_raw}"""))    modules=re
    ${memory_clean}=    Evaluate    "".join(filter(str.isdigit, """${memory_raw}"""))    modules=re
    ${disk_clean}=    Evaluate    "".join(filter(str.isdigit, """${disk_raw}"""))    modules=re


    ${cpu_usage}=    Convert To Integer    ${cpu_clean}
    ${memory_usage}=    Convert To Integer    ${memory_clean}
    ${disk_usage}=    Convert To Integer    ${disk_clean}

   
    Log    Charge CPU : ${cpu_usage} %
    Log    Utilisation mémoire : ${memory_usage} %
    Log    Utilisation disque : ${disk_usage} %

    #  Vérifier que les valeurs respectent les seuils définis
    Run Keyword If    ${cpu_usage} >= ${MAX_CPU_USAGE}    Fail    La charge CPU dépasse 80%.
    Run Keyword If    ${memory_usage} >= ${MAX_MEMORY_USAGE}    Fail    L'utilisation mémoire dépasse 90%.
    Run Keyword If    ${disk_usage} >= ${MAX_DISK_USAGE}    Fail    L'utilisation du disque dépasse 90%.
    Close a Browser