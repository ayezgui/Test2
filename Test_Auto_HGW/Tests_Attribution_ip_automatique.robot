*** Settings ***
Resource    ../Keywords/ssh_keywords.robot
Library     Collections
Library     String
Resource     ../Variables/HGW_variables.robot

*** Test Cases ***
Vérifier l'attribution automatique d'adresse IP aux appareils connectés
    [Documentation]  Ce cas de test vérifie que le service DHCP attribue correctement une adresse IP à un appareil connecté.
    OPEN SSH SESSION    ${HOST}    ${PORT}    ${USERNAME}    ${PASSWORD}
    ${leases}=    EXECUTE SSH COMMAND    cat /var/lib/misc/dnsmasq.leases
    Should Contain    ${leases}    ${MAC}
    Should Contain    ${leases}    192.168.4.
    CLOSE SSH SESSION
    Log    Hello

