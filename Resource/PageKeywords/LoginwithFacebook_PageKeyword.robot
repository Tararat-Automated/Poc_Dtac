*** Settings ***
Library           AppiumLibrary
Library           String
Resource          ../PageRepository/Android/LoginwithFacebook_PageRepositoey.robot
Resource          ../PageLocaillized/LoginwithFacebook_PageLocailized.robot
Resource          ../PageKeywords/MyCommon.robot


*** Variables ***
${REMOTE_URL}     ${ar_Porturl}    # URL to appium server
${PLATFORM_NAME}    ${ar_pfname}   #Android    #iOS
${PLATFORM_VERSION}   ${ar_pfversion}   #8.0.0   #12.4.8   #13.5
${DEVICE_NAME}    ${ar_devicename}    #emulator01   #Galaxy S7  #iPhone 6_test
#Appium uses the *.app directory that is created by the ios build to provision the emulator.
${APP_LOCATION}        /Users/tararatwongsansee/Library/Developer/Xcode/DerivedData/HelloWorld-bbngffhwfyxyttaldcffavwhodbz/Build/Products/Debug-iphonesimulator/HelloWorld.app
${BUNDLE_ID}         th.co.crie.dtacservices   #com.mock.HelloWorld
${APP_PACKAGE}    th.co.crie.tron2.android  
${APP_ACTIVITY}       th.co.dtac.function.SplashScreenActivity
${PLATFORM}     ${ar_OS}


*** Keywords ***
Open App 
     Run Keyword If    "${PLATFORM}"=="Android"    Android Open app
     ...    ELSE IF     "${PLATFORM}"=="iOS"   iOS Open App
     
Android Open app
     Open Application    ${ar_Porturl}    platformName=${ar_OS}    platformVersion=${ar_pfversion}    deviceName=${ar_devicename}    appPackage=${APP_PACKAGE}    appActivity=${APP_ACTIVITY}

iOS Open App     
     Open Application    ${ar_Porturl}    platformName=${ar_OS}    platformVersion=${ar_pfversion}
     ...    deviceName=${ar_devicename}      app=${APP_LOCATION}         

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

Input Account Feacbook
     Wait Until Keyword Succeeds    30s    2s      Wait Until Page Contains Element     ${Loginemail}
     Input Text       ${Loginemail}     ${txtEmail} 
     Input Text       ${Loginpassword}    ${txtpassword}
     Click Element    ${SigninFB}
     # Click Element    ${NotSave}
     Wait Until Keyword Succeeds    30s    2s      Wait Until Page Contains Element    ${Continue}
     Click Element    ${Continue}

Close All Apps
     Capture Page Screenshot
     Close All Applications
