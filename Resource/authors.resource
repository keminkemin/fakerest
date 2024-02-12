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

User POST author
    [Arguments]    ${id}    ${idBook}    ${firstName}    ${lastName}
    ${header}=    Create Dictionary    accept=application/json; v=1.0    Content-Type=application/json; v=1.0
    ${body}=    Create Dictionary    id=${id}    idBook=${idBook}    firstName=${firstName}    lastName=${lastName}
    Create Session    postAuthors    ${baseUrl}    disable_warnings=1    headers=${header}    
    ${postAuthors}=    POST On Session    postAuthors    /api/v1/Authors    json=${body}    expected_status=Anything
    ${postAuthorsJson}=    Set Variable    ${postAuthors.json}
    ${postAuthorsStatusCode}=    Convert To String    ${postAuthors.status_code}
    Set Test Variable    ${postAuthorsJson}
    Set Test Variable    ${postAuthorsStatusCode}

User validate POST authors status code.
    [Arguments]    ${expectedStatusCode}
    Should Be Equal    ${postAuthorsStatusCode}    ${expectedStatusCode}
