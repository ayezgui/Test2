*** Settings ***
Resource     ../Variables/HGW_variables.robot
Resource     ../Keywords/ssh_keywords.robot
Resource     ../Keywords/API_Keywords.robot

*** Test Cases ***
Vérifier que le service Hostapd est actif via API
    [Documentation]    Ce test vérifie que le service Hostapd est actif via l’API Flask du Raspberry Pi
    Create HTTP Session  ${SESSION_NAME}   ${BASE_URL}
    ${response}=    Send GET Request    ${SESSION_NAME}  ${endpoint}
    ${body}=        Get Response Body    ${response}
    Should Be Equal    ${body['status']}    active
    Delete HTTP Session  

Vérifier que le service SSH est actif via API
    [Documentation]    Ce test vérifie que le service SSH est actif via l’API Flask du Raspberry Pi
    Create HTTP Session    ${SESSION_NAME}    ${BASE_URL}
    ${response}=    Send GET Request    ${SESSION_NAME}    /api/services/ssh/status
    ${body}=        Get Response Body    ${response}
    Should Be Equal    ${body['status']}    active
    Delete HTTP Session

Vérifier que le service DNSMasq est actif via API
    [Documentation]    Ce test vérifie que le service DNSMasq est actif via l’API Flask du Raspberry Pi
    Create HTTP Session    ${SESSION_NAME}    ${BASE_URL}
    ${response}=    Send GET Request    ${SESSION_NAME}    /api/services/dnsmasq/status
    ${body}=        Get Response Body    ${response}
    Should Be Equal    ${body['status']}    active
    Delete HTTP Session

Vérifier que le service iptables est actif via API
    [Documentation]    Ce test vérifie que le service IPtables est actif via l’API Flask du Raspberry Pi
    Create HTTP Session    ${SESSION_NAME}    ${BASE_URL}
    ${response}=    Send GET Request    ${SESSION_NAME}    /api/services/iptables/status
    ${body}=        Get Response Body    ${response}
    Should Be Equal    ${body['status']}    active
    Delete HTTP Session