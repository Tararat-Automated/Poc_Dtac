*** Settings ***
Library           AppiumLibrary
Resource         ../Poc_Dtac/Resource/PageKeywords/LoginwithFacebook_PageKeyword.robot

*** Test Cases ***
test_demo
     Open App
     # Click Signin with Feacbook
     Click Signin with Feacbook ios
     Click Choose a number to login
     # Verify Login Page
     Close All Apps