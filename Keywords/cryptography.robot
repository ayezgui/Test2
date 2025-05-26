*** Settings ***
Library    cryptography_keywords.py

*** Variables ***
${KEY}    ${EMPTY}
${FILE_PATH}    C:/Users/arezgui/Documents/texte_secret.txt

*** Test Cases ***
Test Chiffrement et Déchiffrement
    ${KEY}=    Generate Key
    Log    Clé générée: ${KEY}
    
    # Lire le texte depuis le fichier
    ${TEXT}=    Read File    ${FILE_PATH}
    Log    Texte original: ${TEXT}
    
    # Chiffrer le texte
    ${encrypted}=    Encrypt Text    ${KEY}    ${TEXT} 
    Log    Données chiffrées: ${encrypted}
    
    # Déchiffrer le texte
    ${decrypted}=    Decrypt Text    ${KEY}    ${encrypted}   
    Log    Données déchiffrées: ${decrypted}

