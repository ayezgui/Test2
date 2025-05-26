*** Settings ***
Library  RequestsLibrary
Resource  ../Variables/HGW_variables.robot


*** Keywords ***

Create HTTP Session
    [Arguments]     ${SESSION_NAME}  ${BASE_URL}
    #${auth}=  Create List  ${user}  ${password}
    Create Session  ${SESSION_NAME}  ${BASE_URL}  #auth=${auth}

Send GET Request
    [Arguments]   ${SESSION_NAME}  ${endpoint}
    ${response}=  GET On Session  ${SESSION_NAME}  ${endpoint}
    RETURN  ${response}


Send POST Request
    [Arguments]  ${endpoint}  ${body}
    ${headers}=  Create Dictionary  Content-Type=application/json
    ${response}=  POST On Session  ${SESSION_NAME}  ${endpoint}  json=${body}  headers=${headers}
    RETURN  ${response}


Send PUT Request
    [Arguments]  ${endpoint}  ${body}
    ${headers}=  Create Dictionary  Content-Type=application/json
    ${response}=  PUT On Session  ${SESSION_NAME}  ${endpoint}  json=${body}  headers=${headers}
    RETURN  ${response}


Send DELETE Request
    [Arguments]  ${endpoint}
    ${response}=  DELETE On Session  ${SESSION_NAME}  ${endpoint}
    RETURN  ${response}


Get Response Status Code
    [Arguments]  ${response}
    RETURN  ${response.status_code}


Get Response Body
    [Arguments]  ${response}
    RETURN  ${response.json()}


Delete HTTP Session
    Delete All Sessions
