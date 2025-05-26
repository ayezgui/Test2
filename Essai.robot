*** Settings ***
Library  SeleniumLibrary 
Documentation   Essai
Test Teardown    Run Keyword If Test Failed    Capture Page Screenshot

*** Variables ***

*** Test Cases ***
Recherche Google
   [Tags]  aya
   Open NavigatorChrome
   Go To   https://www.sofrecom.com/a-propos-de-nous/notre-equipe/sofrecom-tunisie.html
   Log Title
For Looop1 
   [Tags]  eya
   FOR    ${i}    IN RANGE    1    10    
       Log to console   ${i}
       
   END
   Log To Console     AYAr

   FOR    ${var}    IN    one    two    ${3}    four    ${5}
    ...    kuusi    7    eight    nine    ${6}
        Log    ${var}
    END
   

    
*** Keywords ***
Open NavigatorChrome
   Open Browser   https://www.google.fr/      Chrome
   Maximize Browser Window
   # Capture Element Screenshot    xpath:/html/body/div[1]/div[2]/div/img  
   # Capture Page Screenshot
   Press Keys  //*[@id="APjFqb"]  Selenium
   Press Keys  //*[@id="APjFqb"]  ENTER   

   