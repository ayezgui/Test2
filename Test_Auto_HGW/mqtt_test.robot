*** Settings ***
Library    MQTTLibrary
Library    Collections
Library    OperatingSystem
Library    BuiltIn
Library    JSONLibrary   
Resource     ../Variables/HGW_variables.robot

*** Test Cases ***
Récupérer État Santé Raspberry MQTT
    [Documentation]    Ce cas de test vérifie que le Raspberry Pi publie périodiquement des informations de diagnostic (température, CPU, RAM, disque) via MQTT.
    Connect    ${BROKER_MQTT}    ${PORT_MQTT}
    @{messages}=    Subscribe    ${TOPIC}    qos=${QOS}    timeout=${TIMEOUT}    limit=${LIMIT}
    Length Should Be    ${messages}    1
    ${json_string}=    Set Variable    ${messages[0]}
    ${data}=    Convert String To Json    ${json_string}
    Log    Température : ${data["temperature"]} °C
    Log    Utilisation CPU : ${data["cpu_usage"]} %
    Log    RAM Totale : ${data["ram_total"]} Mo
    Log    RAM Utilisée : ${data["ram_used"]} Mo
    Log    Espace disque total : ${data["disk_total"]} Go
    Log    Espace disque utilisé : ${data["disk_used"]} Go
    Log To Console    Température : ${data["temperature"]} °C , Utilisation CPU : ${data["cpu_usage"]} % , RAM Totale : ${data["ram_total"]} Mo , RAM Utilisée : ${data["ram_used"]} Mo , Espace disque total : ${data["disk_total"]} Go , Espace disque utilisé : ${data["disk_used"]} Go
    Disconnect

Vérifier État Santé Raspberry
    [Documentation]    Ce cas de test vérifie que les valeurs de diagnostic du Raspberry Pi sont inférieures aux seuils critiques définis.
    Connect    ${BROKER_MQTT}    ${PORT_MQTT}
    @{messages}=    Subscribe    ${TOPIC}    qos=${QOS}    timeout=${TIMEOUT}    limit=${LIMIT}
    Length Should Be    ${messages}    1
    ${json_string}=    Set Variable    ${messages[0]}
    ${data}=    Convert String To Json    ${json_string}
    Run Keyword If    ${data["temperature"]} > ${TEMP_LIMIT}         Fail    Température trop élevée (${data["temperature"]} °C > ${TEMP_LIMIT} °C)
    Run Keyword If    ${data["cpu_usage"]} > ${CPU_LIMIT}            Fail    CPU trop sollicitée (${data["cpu_usage"]} % > ${CPU_LIMIT} %)
    Run Keyword If    ${data["ram_used"]} > ${RAM_USAGE_LIMIT}       Fail    RAM trop utilisée (${data["ram_used"]} Mo > ${RAM_USAGE_LIMIT} Mo)
    Run Keyword If    ${data["disk_used"]} > ${DISK_USAGE_LIMIT}     Fail    Disque presque plein (${data["disk_used"]} Go > ${DISK_USAGE_LIMIT} Go)

