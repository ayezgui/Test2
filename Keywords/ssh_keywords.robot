*** SETTINGS ***
Library    SSHLibrary

*** KEYWORDS ***
OPEN SSH SESSION
    [Arguments]    ${HOST}    ${PORT}    ${USER}    ${PASSWORD}
    Open Connection    ${HOST}    port=${PORT}
    Login    ${USER}    ${PASSWORD}

EXECUTE SSH COMMAND
    [Arguments]    ${COMMAND}
    ${RESULT}=    Execute Command    ${COMMAND}    
    [Return]    ${RESULT}

CLOSE SSH SESSION
    Close Connection

