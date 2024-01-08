*** Settings ***
Resource    ../Resource/authors.resource

*** Test Cases ***
User GET author.
    User GET author.
    User validate GET authors status code.    200
    