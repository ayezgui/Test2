*** Settings ***
Resource     ../Keywords/ssh_keywords.robot
Resource     ../Keywords/SeleniumKeywords.robot
Resource     ../Variables/HGW_variables.robot
 
*** Test Cases ***

Test Block HTTPS Access
    # Nettoyage initial : suppression de toute règle existante
    Open SSH Session    ${HOST}    ${PORT}    ${USERNAME}    ${PASSWORD}
    Execute SSH Command    sudo iptables -D FORWARD -p tcp --dport 443 -s ${TARGET_IP} -j DROP
    Sleep    2s
    Close SSH Session

    # Bloquer l'accès HTTPS (port 443)
    Open SSH Session    ${HOST}    ${PORT}    ${USERNAME}    ${PASSWORD}
    Execute SSH Command    sudo iptables -I FORWARD 1 -p tcp --dport 443 -s ${TARGET_IP} -j DROP
    Sleep    5s
    Close SSH Session

    # Tester l'inaccessibilité du site
    Open a browser    ${URL}    Chrome    
    Wait Until Page Contains    Ce site est inaccessible    timeout=100s
    Close a Browser

Test Unblock HTTPS Access
    # Débloquer l'accès HTTPS
    Open SSH Session    ${HOST}    ${PORT}    ${USERNAME}    ${PASSWORD}
    Execute SSH Command    sudo iptables -D FORWARD -p tcp --dport 443 -s ${TARGET_IP} -j DROP
    Sleep    5s
    Close SSH Session

    # Vérifier que le site est maintenant accessible
    Open a browser    ${URL}    Chrome    
    Wait Until Page Contains    Google    timeout=90s
    Close a Browser
