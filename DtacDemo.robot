*** Settings ***
Library           AppiumLibrary
Resource          Resource/PageKeywords/LoginwithFacebook_PageKeyword.robot

*** Test Cases ***
test_demo
     Open App
     Signin with Facebook
     Input Facebook
     # Click Signin with Feacbook
     # Input Account Feacbook android     # beer
     # Click Signin with Feacbook
     # Click Signin with Feacbook ios         # pear
     Click Choose a number to login
     Verify Login Page
     Close All Apps
