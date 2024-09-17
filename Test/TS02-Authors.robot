*** Settings ***
Resource    ../Resource/authors.resource

*** Test Cases ***
User able to GET author.
    User GET author.
    User validate GET authors status code.    200
    
User able to POST author.
    User POST author    2    2    John    Doe
    User validate POST authors status code.    200

User not able to POST author with empty id.
    User POST author    ${EMPTY}    2    John    Doe
    User validate POST authors status code.    400

User not able to POST author with empty idBook.
    User POST author    2    ${EMPTY}    John    Doe
    User validate POST authors status code.    400

User able to POST author with empty firstName.
    User POST author    2    2    ${EMPTY}    Doe
    User validate POST authors status code.    200

User able to POST author with empty lastName.
    User POST author    2    2    John  ${EMPTY}
    User validate POST authors status code.    200

User able to get authors book by id.
    User GET author book by id.    4
    User validate GET authors status code.    200
    Validate get author book response message    4