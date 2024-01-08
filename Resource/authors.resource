*** Settings ***
Resource    ../Resource/init.resource
Library    RequestsLibrary

*** Keywords ***
User GET author.
    ${header}=    Create Dictionary    accept=application/json; v=1.0
    Create Session    getAuthors    ${baseUrl}    disable_warnings=1    headers=${header} 
    ${getAuthors}=    GET On Session    getAuthors    api/v1/Authors   expected_status=Anything
    ${getAuthorsJson}=    Set Variable    ${getAuthors.json()}
    ${getAuthorsStatusCode}=    Convert To String    ${getAuthors.status_code}
    Set Test Variable    ${getAuthorsJson}
    Set Test Variable    ${getAuthorsStatusCode}

User validate GET authors status code.
    [Arguments]    ${expectedStatusCode}
    Should Be Equal    ${getAuthorsStatusCode}    ${expectedStatusCode}