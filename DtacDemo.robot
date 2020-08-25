*** Settings ***
Library           AppiumLibrary
Resource         Resource/PageKeywords/LoginwithFacebook_PageKeyword.robot

*** Test Cases ***
test_demo
     Open App
     Click Signin with Feacbook
     Login facebook
     Click Choose a number to login
     # Verify Login Page
     Close All Apps