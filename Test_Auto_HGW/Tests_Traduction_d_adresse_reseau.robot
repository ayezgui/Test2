
*** Settings ***
Resource     ../Keywords/ssh_keywords.robot
Resource     ../Keywords/Seleniumkeywords.robot
Resource     ../Variables/HGW_variables.robot
*** Test Cases ***
Vérifier la configuration de la traduction d'adresses réseau (NAT)
    [Documentation]    Ce cas de test vérifie que la traduction d'adresses réseau (NAT) est correctement configurée sur le système, en s'assurant que la règle de **MASQUERADE** est présente dans la table de NAT. 
    Open SSH Session    ${HOST}    ${PORT}    ${USERNAME}    ${PASSWORD}
    ${result}=    Execute SSH Command    sudo iptables -t nat -L -n -v
    Log    Résultat de la configuration NAT : ${result}
    Should Contain    ${result}    MASQUERADE   # Vérifie que la règle MASQUERADE est présente
    Close SSH Session

Vérifier le masquage des adresses IP privées via la translation d'adresses réseau (NAT)
    [Documentation]    Ce cas de test vérifie que les adresses IP privées des appareils connectés au réseau local sont masquées via  (NAT) en utilisant whatismyipaddress.com.
    
    # Récupérer l'adresse IP publique du Raspberry Pi
    Open SSH Session    ${HOST}    ${PORT}    ${USERNAME}    ${PASSWORD}
    ${public_ip_raspberry}=    Execute SSH Command    curl ifconfig.me
    Log    Adresse IP publique du Raspberry Pi : ${public_ip_raspberry}
    Close SSH Session

    Open a browser    ${WHATISMYIP_URL}    chrome
    Wait Until Page Contains    My IP Address is:    timeout=10s

    ${public_ip_whatismyip}=    Get Text    xpath://*[@id="ipv4"]/a
    Log    Adresse IP publique détectée sur WhatIsMyIPAddress.com : ${public_ip_whatismyip}

    Should Be Equal As Strings    ${public_ip_raspberry.strip()}    ${public_ip_whatismyip.strip()}    msg=L'adresse IP publique ne correspond pas.
    Should Not Contain    ${public_ip_whatismyip}    ${PRIVATE_IP}    msg=L'adresse IP privée est exposée.
    Close a Browser