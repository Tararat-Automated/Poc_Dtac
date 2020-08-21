*** Settings ***
Library           AppiumLibrary
Resource         ../DemoDtac/Android/Resource/PageKeywords/LoginwithFacebook_PageKeyword.robot

*** Test Cases ***
test_demo
     Open App
     Close All Apps