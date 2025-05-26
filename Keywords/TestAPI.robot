*** Settings ***
Resource  API_Keywords.robot 

Suite Setup       Create HTTP Session
Suite Teardown    Delete HTTP Session

*** Variables ***
${BASE_URL}   https://petstore.swagger.io/v2
${SESSION_NAME}   my_session

*** Test Cases ***

Test GET Request
    ${response}=  Send GET Request   /pet/1    
    Log  ${response}

Test POST Request for Creating Pet
    ${post_body}=  Create Dictionary
    ...  id=0
    ...  category=Create Dictionary  id=0  name=string
    ...  name=doggie
    ...  photoUrls=Create List  string
    ...  tags=Create List  Create Dictionary  id=0  name=string
    ...  status=available

    ${response}=  Send POST Request   /pet   ${post_body}
    Log  ${response}

Test PUT Request for Updating Pet
    ${put_body}=  Create Dictionary
    ...  id=0
    ...  category=Create Dictionary  id=0  name=string
    ...  name=doggie
    ...  photoUrls=Create List  string
    ...  tags=Create List  Create Dictionary  id=0  name=string
    ...  status=available

    ${response}=  Send PUT Request   /pet   ${put_body}
    Log  ${response}

Test DELETE Request for Deleting Pet
    ${response}=  Send DELETE Request   /pet/2
    Log  ${response}
