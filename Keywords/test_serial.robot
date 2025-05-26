*** Settings ***
Resource   SerialKeywords.robot

*** Variables ***
${PORT}      COM...
${BAUDRATE}  9600...
${USER}      eyare
${PASSWORD}  .....
${COMMAND}   whoami
${TIMEOUT}   3s

*** Test Cases ***
Test Serial Connection
    Open Serial Connection    ${PORT}    ${BAUDRATE}
    Login    ${USER}    ${PASSWORD}
    Execute Command    ${COMMAND}
    ${output}    Receive Result    ${TIMEOUT}
    Log    ${output}
    Close Serial Connection
