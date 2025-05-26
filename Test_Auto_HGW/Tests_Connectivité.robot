*** Settings ***
Resource     ../Keywords/ssh_keywords.robot
Resource     ../Variables/HGW_variables.robot

*** Test Cases ***
Vérifier que le point d'accès est actif
    [Documentation]   Ce cas de test vérifie que l'interface WiFi du Raspberry Pi est en mode Point d'Accès 
    OPEN SSH SESSION    ${HOST}    ${PORT}    ${USERNAME}    ${PASSWORD}
    ${output}=    EXECUTE SSH COMMAND    /sbin/iw dev
    Should Contain    ${output}    type AP
    CLOSE SSH SESSION

Vérifier que l'interface Ethernet est active
    [Documentation]  Ce cas de test vérifie que l'interface Ethernet du Raspberry Pi est active et fonctionnelle.
    OPEN SSH SESSION    ${HOST}    ${PORT}    ${USERNAME}    ${PASSWORD}
    ${etat}=    Execute Command    cat /sys/class/net/eth0/operstate
    Should Be Equal    ${etat.strip()}    up
    CLOSE SSH SESSION

Vérifier l'accès Internet via Ethernet
    [Documentation]  Ce cas de test vérifie que le Raspberry Pi a un accès à Internet via l'interface Ethernet.
    OPEN SSH SESSION    ${HOST}    ${PORT}    ${USERNAME}    ${PASSWORD}
    ${output}=    Execute Command    ping -c 3 8.8.8.8
    Should Contain    ${output}    bytes from
    CLOSE SSH SESSION 
    
Vérifier qu'un appareil spécifique est connecté en temps réel
    [Documentation]  Ce cas de test vérifie que l'appareil dont l'adresse MAC est 60:f2:62:77:04:34 est bien connecté en temps réel au point d'accès WiFi du Raspberry Pi.
    OPEN SSH SESSION    ${HOST}    ${PORT}    ${USERNAME}    ${PASSWORD}
    ${output}=    EXECUTE SSH COMMAND    /sbin/iw dev wlan0 station dump
    Log    ${output}
    Should Contain    ${output}    60:f2:62:77:04:34
    CLOSE SSH SESSION