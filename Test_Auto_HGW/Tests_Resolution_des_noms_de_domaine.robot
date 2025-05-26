*** Settings ***
Resource     ../Keywords/ssh_keywords.robot
Resource     ../Keywords/Seleniumkeywords.robot
Resource     ../Variables/HGW_variables.robot
*** Test Cases ***
Vérifier la configuration du système de résolution de noms[DNS]
    [Documentation]    Ce cas de test vérifie que les serveurs DNS sont correctement configurés sur la passerelle.
    OPEN SSH SESSION    ${HOST}    ${PORT}    ${USERNAME}    ${PASSWORD}
    ${dns}=    EXECUTE SSH COMMAND    cat /etc/dnsmasq.conf
    Should Contain    ${dns}    8.8.8.8
    Should Contain    ${dns}    8.8.4.4
    CLOSE SSH SESSION
Résolution d_un Nom de Domaine Valide
    [Documentation]    Ce cas de test vérifie que le service DNS résout correctement un nom de domaine valide en une adresse IP 
    OPEN SSH SESSION    ${HOST}    ${PORT}    ${USERNAME}    ${PASSWORD}
    ${output}=    Execute Command    nslookup ${VALID_DOMAIN}
    Should Contain    ${output}    Address:
    CLOSE SSH SESSION
Résolution d_un Nom de Domaine Invalide
    [Documentation]    Ce cas de test vérifie que le service DNS détecte correctement qu'un nom de domaine invalide ne peut pas être résolu.
    OPEN SSH SESSION    ${HOST}    ${PORT}    ${USERNAME}    ${PASSWORD}
    ${output}=    Execute Command    nslookup ${INVALID_DOMAIN}
    Should Contain    ${output}    can't find ${INVALID_DOMAIN}
    CLOSE SSH SESSION
Résolution DNS via un Navigateur Web
    [Documentation]    Ce cas de test vérifie que la résolution DNS fonctionne correctement via un navigateur web
    Open a Browser    ${WEB_URL}    chrome
    Page Should Contain    À PROPOS DE NOUS
    Close a Browser

