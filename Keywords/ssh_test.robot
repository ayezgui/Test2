*** Settings ***
Resource    ./ssh_keywords.robot  

*** Variables ***
${HOST}      192.168.4.1
${PORT}      22  
${USER}      pi4  #  utilisateur du raspberry 
${PASSWORD}  raspberrypi  
${COMMAND}   whoami

*** Test Cases ***
Test SSH Connection
    Open SSH Session    ${HOST}    ${PORT}    ${USER}    ${PASSWORD}
    ${result}=    Execute SSH Command    ${COMMAND}
    Log To Console  ${result}
    Close SSH Session
