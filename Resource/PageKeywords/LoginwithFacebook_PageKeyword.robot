*** Settings ***
Library           AppiumLibrary
Library           String
Resource          ../../Resource/PageRepository/Android/LoginwithFacebook_PageRepositoey.robot
Resource          ../../Resource/PageLocaillized/LoginwithFacebook_PageLocailized.robot
Resource          ../../Resource/PageKeywords/MyCommon.robot


*** Variables ***
${REMOTE_URL}     http://localhost:4723/wd/hub      # URL to appium server
${PLATFORM_NAME}    Android   #Android    #iOS
${PLATFORM_VERSION}   8.0.0   #8.0.0   #12.4.8   #13.5
${DEVICE_NAME}    Galaxy S7   #Galaxy S7  #iPhone 6_test
#Appium uses the *.app directory that is created by the ios build to provision the emulator.
${APP_LOCATION}        /Users/tararatwongsansee/Library/Developer/Xcode/DerivedData/HelloWorld-bbngffhwfyxyttaldcffavwhodbz/Build/Products/Debug-iphonesimulator/HelloWorld.app
${BUNDLE_ID}         th.co.crie.dtacservices   #com.mock.HelloWorld
${APP_PACKAGE}    th.co.crie.tron2.android  
${APP_ACTIVITY}       th.co.dtac.function.SplashScreenActivity

*** Keywords ***
Open App
     # Open Application    ${REMOTE_URL}    platformName=${PLATFORM_NAME}    platformVersion=${PLATFORM_VERSION}
     #  ...    deviceName=${DEVICE_NAME}      app=${BUNDLE_ID}     #automationName=appium   
     Open Application    ${REMOTE_URL}    platformName=${PLATFORM_NAME}    platformVersion=${PLATFORM_VERSION}    deviceName=${DEVICE_NAME}    appPackage=${APP_PACKAGE}    appActivity=${APP_ACTIVITY}

Click Signin with Feacbook
    Wait Until Keyword Succeeds    30s    2s      Wait Until Page Contains Element     ${Loginfacebook}
    Click Element     ${Loginfacebook}

Click Choose a number to login 
    Wait Until Keyword Succeeds    30s    2s      Wait Until Page Contains Element    ${ChooseNumber}
    ${Number}=     Get Text     ${ChooseNumber}
    Set Global Variable     ${Number}
    Click Element     ${ChooseNumber}

Verify Login Page
     Mobile element text should be      ${ToolbarTitle}      ${txtToolbarTitle}
     ${NumberProfile}=     Get Text     ${ProfilePhoneNumber}      
     Set Global Variable    ${NumberProfile}
      Should Be String      ${Number}    ${NumberProfile}


Close All Apps
     Close All Applications
