*** Settings ***
Resource     ../Keywords/ssh_keywords.robot
Resource     ../Variables/HGW_variables.robot

*** Test Cases ***
Vérifier l'activation de IP Forwarding
    [Documentation]    Ce cas de test vérifie que le transfert d'adresses IP (IP forwarding) est activé sur la passerelle, ce qui permet au Raspberry Pi de rediriger le trafic réseau entre différentes interfaces  (Wi-Fi wlan0 et Ethernet eth0)
    Open SSH Session    ${HOST}    ${PORT}    ${USERNAME}    ${PASSWORD}
    ${result}=    Execute SSH Command    sudo sysctl net.ipv4.ip_forward
    Log    Résultat : ${result}
    Should Contain    ${result}    net.ipv4.ip_forward = 1
    Close SSH Session
Vérifier la table de routage
    [Documentation]    Ce cas de test vérifie que la table de routage du Raspberry Pi contient les interfaces réseau attendues, assurant une bonne redirection du trafic entre Ethernet et Wi-Fi.
    Open SSH SESSION    ${HOST}    ${PORT}    ${USERNAME}    ${PASSWORD}
    ${result}=    EXECUTE SSH COMMAND    sudo route -n
    Log    Résultat de la table de routage : ${result}
    Should Contain    ${result}    0.0.0.0  
    Should Contain    ${result}    eth0    
    Should Contain    ${result}    wlan0    
    CLOSE SSH SESSION
Vérifier la connectivité entre les interfaces réseau (Wi-Fi et Ethernet)
    [Documentation]    Ce cas de test vérifie que la communication entre l'interface Ethernet et l'interface Wi-Fi est fonctionnelle
    Open SSH SESSION    ${HOST}    ${PORT}    ${USERNAME}    ${PASSWORD}
    ${result}=    EXECUTE SSH COMMAND    ping -c 4 ${CLIENT_IP}
    Log    ${result}
    Should Contain    ${result}    4 packets transmitted, 4 received
    CLOSE SSH SESSION