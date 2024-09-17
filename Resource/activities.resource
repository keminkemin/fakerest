*** Settings ***
Resource    ../Resource/init.resource

*** Keywords ***
User GET activities.
    ${header}=    Create Dictionary    accept=application/json; v=1.0
    Create Session    getActivities    ${baseUrl}    disable_warnings=1
    ${getActivities}=    GET On Session    getActivities    /api/v1/Activities    headers=${header}    expected_status=Anything
    ${getActivitiesJson}=    Set Variable    ${getActivities.json()}
    ${getActivitiesStatusCode}=    Convert To String    ${getActivities.status_code}
    Set Test Variable    ${getActivitiesJson}
    Set Test Variable    ${getActivitiesStatusCode}

User validate GET activities status code.
    [Arguments]    ${expectedStatusCode}
    Should Be Equal    ${getActivitiesStatusCode}    ${expectedStatusCode}

User POST activities.
    ${jsonData}=    Catenate    {
    ...    "id": 0,
    ...    "title": "string",
    ...    "dueDate": "2024-01-07T19:30:40.462Z",
    ...    "completed": true
    ...    }
    ${body}=    Evaluate  json.loads($jsonData)
    ${header}=    Create Dictionary    accept=text/plain; v=1.0   Content-Type=application/json; v=1.0
    Create Session    postActivities    ${baseUrl}    disable_warnings=1
    ${postActivities}=    POST On Session    postActivities    /api/v1/Activities    json=${body}    headers=${header}    expected_status=Anything
    ${postActivitiesJson}=    Set Variable    ${postActivities.json()}
    ${postActivitiesStatusCode}=    Convert To String    ${postActivities.status_code}
    Set Test Variable    ${postActivitiesJson}
    Set Test Variable    ${postActivitiesStatusCode}

User validate POST activities status code.
    [Arguments]    ${expectedStatusCode}
    Should Be Equal    ${postActivitiesStatusCode}    ${expectedStatusCode}

User GET activities ID.
    [Arguments]    ${id}
    ${header}=    Create Dictionary    accept=application/json; v=1.0
    Create Session    getActivitiesId    ${baseUrl}    disable_warnings=1
    ${getActivitiesId}=    GET On Session    getActivitiesId    /api/v1/Activities/${id}    headers=${header}    expected_status=Anything
    ${getActivitiesIdJson}=    Set Variable    ${getActivitiesId.json()}
    ${getActivitiesIdStatusCode}=    Convert To String    ${getActivitiesId.status_code}
    Set Test Variable    ${getActivitiesIdJson}
    Set Test Variable    ${getActivitiesIdStatusCode}

User validate GET activities ID status code.
    [Arguments]    ${expectedStatusCode}
    Should Be Equal    ${getActivitiesIdStatusCode}    ${expectedStatusCode}

User PUT activities ID.
    ${header}=    Create Dictionary    accept=*/*
    Create Session    putActivitiesId    ${baseUrl}    disable_warnings=1
    ${putActivitiesId}=    GET On Session    putActivitiesId    /api/v1/Activities/30    headers=${header}    expected_status=Anything
    ${putActivitiesIdJson}=    Set Variable    ${putActivitiesId.json()}
    ${putActivitiesIdStatusCode}=    Convert To String    ${putActivitiesId.status_code}
    Set Test Variable    ${putActivitiesIdJson}
    Set Test Variable    ${putActivitiesIdStatusCode}

User validate PUT activities ID status code.
    [Arguments]    ${expectedStatusCode}
    Should Be Equal    ${putActivitiesIdStatusCode}    ${expectedStatusCode}

User DELETE activities ID.
    ${header}=    Create Dictionary    accept=*/*
    Create Session    deleteActivitiesId    ${baseUrl}    disable_warnings=1
    ${deleteActivitiesId}=    GET On Session    deleteActivitiesId    /api/v1/Activities/30    headers=${header}    expected_status=Anything
    ${deleteActivitiesIdJson}=    Set Variable    ${deleteActivitiesId.json()}
    ${deleteActivitiesIdStatusCode}=    Convert To String    ${deleteActivitiesId.status_code}
    Set Test Variable    ${deleteActivitiesIdJson}
    Set Test Variable    ${deleteActivitiesIdStatusCode}

User validate DELETE activities ID status code.
    [Arguments]    ${expectedStatusCode}
    Should Be Equal    ${deleteActivitiesIdStatusCode}    ${expectedStatusCode}