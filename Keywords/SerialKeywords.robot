*** Settings ***
Library    SerialLibrary

*** Keywords ***
Open Serial Connection
    [Arguments]    ${port}    ${baudrate}
    Open Port    ${port}
    Set Port Parameter    baudrate    ${baudrate}
    #Set Port Parameter    bytesize    8
    #Set Port Parameter    parity      N
    #Set Port Parameter    stopbits    1
    #Set Port Parameter    timeout     3

Login
    [Arguments]    ${user}    ${password}
    Write Data    ${user}\n
    Write Data    ${password}\n

Execute Command
    [Arguments]    ${command}
    Write Data    ${command}\n

Receive Result
    [Arguments]    ${timeout}
    ${result}    Read Until    timeout=${timeout}
    [Return]    ${result}

Close Serial Connection
    Close Port
