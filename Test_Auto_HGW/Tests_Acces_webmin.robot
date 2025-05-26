*** Settings ***
Resource     ../Keywords/SeleniumKeywords.robot
Resource     ../Variables/HGW_variables.robot

*** Test Cases ***
 Vérifier l'Accès Réussi à Webmin avec Identifiants Valides
    [Documentation]    Ce cas de tesr vérifie que l'interface Webmin est accessible et fonctionnelle.
    Open a browser    ${WEBMIN_URL}    chrome
    Click Element    xpath://*[@id="details-button"]
    Click Element    xpath://*[@id="proceed-link"]
    Input Text Into Selector    id=user   ${USERNAME}
    Input Text Into Selector    name=pass    ${PASSWORD}
    Click Element    xpath://button[@type="submit"]
    Page Should Contain    Dashboard
    Close a Browser
Vérifier l'Accès Échoué à Webmin avec Identifiants Invalides
    [Documentation]    Ce cas de test vérifie qu’un message d’erreur s’affiche lors d’une tentative de connexion avec des identifiants invalides.
    Open a browser    ${WEBMIN_URL}    chrome
    Click Element    xpath://*[@id="details-button"]
    Click Element    xpath://*[@id="proceed-link"]
    Input Text Into Selector    id=user   ${INVALID_USER}
    Input Text Into Selector    name=pass    ${INVALID_PASS}
    Click Element    xpath://button[@type="submit"]
    Page Should Contain    Login failed. Please try again.
    Close a Browser