*** Settings ***
Resource    ../Resource/activities.resource

*** Test Cases ***
User GET activities.
    User GET activities.
    User validate GET activities status code.    200

User POST activities.
    User POST activities.
    User validate POST activities status code.    200

User GET activities ID.
    User GET activities ID.    20
    User validate GET activities ID status code.    200

User PUT activities ID.
    User PUT activities ID.
    User validate PUT activities ID status code.    200

User DELETE activities ID.
    User DELETE activities ID.
    User validate DELETE activities ID status code.    200