*** Settings ***
Library    JSONLibrary        #use this library to manipulate JSON object
Library    Collections        #use this library for handling lists and dictionaries.
Library    String             #use this library for string manipulation and verification.
Library    DateTime           #use this library for handling date and time values.
Library    RequestsLibrary    #use this library for handling http request.

*** Variables ***
${baseUrl}    https://fakerestapi.azurewebsites.net/    #variable for base url that will be used on all or most keywords.