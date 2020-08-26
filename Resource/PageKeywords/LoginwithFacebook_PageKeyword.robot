*** Settings ***
Library           AppiumLibrary
Library           String
Library           yaml
Resource          ../../Resource/PageRepository/Android/LoginwithFacebook_PageRepositoey.robot
Resource          ../../Resource/PageRepository/iOS/LoginwithFacebook_PageRepositoey.robot
Resource          ../../Resource/PageLocaillized/LoginwithFacebook_PageLocailized.robot
Resource          ../../Resource/PageKeywords/MyCommon.robot


*** Variables ***
${REMOTE_URL}     ${ar_Porturl}    #http://localhost:4723/wd/hub      # URL to appium server
#${PLATFORM_NAME}   Android      #iOS
${PLATFORM_VERSION}   ${ar_pfversion}   #8.0.0   #12.4.8   #13.5
${DEVICE_NAME}    ${ar_devicename}    #Galaxy S7  #iPhone 6_test
#Appium uses the *.app directory that is created by the ios build to provision the emulator.
${APP_LOCATION}        /Users/tararatwongsansee/Library/Developer/Xcode/DerivedData/dtac-iservice-efkfqtrdejacsqdowbfiipatkqsx/Build/Products/Debug-iphonesimulator/dtac.app
${BUNDLE_ID}         th.co.crie.dtacservices    #com.mock.HelloWorld
${APP_PACKAGE}    th.co.crie.tron2.android  
${APP_ACTIVITY}       th.co.dtac.function.SplashScreenActivity
${PLATFORM}     ${ar_OS}

*** Keywords ***
Open App 
     Run Keyword If   "${PLATFORM}"=="Android"      Android Open app
     ...  ELSE IF    "${PLATFORM}"=="iOS"    iOS Open app

Android Open app
     Open Application    ${REMOTE_URL}    platformName=${ar_OS}    platformVersion=${ar_pfversion}    deviceName=${ar_devicename}   appPackage=${APP_PACKAGE}    appActivity=${APP_ACTIVITY}

iOS Open app
      Open Application    ${REMOTE_URL}    platformName=${ar_OS}    platformVersion=13.6
      ...    deviceName=iPhone 11    app=${APP_LOCATION}
      Notification ios    ${Don’t_Allow}       

Signin with Facebook
     Run Keyword If   "${PLATFORM}"=="Android"      Click Signin with Feacbook 
     ...  ELSE IF    "${PLATFORM}"=="iOS"    Click Signin with Feacbook ios

Input Facebook
     Run Keyword If   "${PLATFORM}"=="Android"      Input Account Facebook android
     ...  ELSE IF    "${PLATFORM}"=="iOS"    Input Account Facebook iOS

Click Signin with Feacbook
    Wait Until Keyword Succeeds    30s    2s      Wait Until Page Contains Element     ${Loginfacebook}
    Click Element     ${Loginfacebook}


Click Signin with Feacbook ios
    Wait Until Keyword Succeeds    30s    2s      Wait Until Page Contains Element     xpath=//XCUIElementTypeButton[@name="loginwithfacebook"]    #${Loginfacebook_ios}
    Click Element     xpath=//XCUIElementTypeButton[@name="loginwithfacebook"]   #${Loginfacebook_ios}
    Wait Until Keyword Succeeds    30s    2s      Wait Until Page Contains Element     xpath=//XCUIElementTypeButton[@name="Continue"]
    Notification use facebook     Continue


Click Choose a number to login 
     Run Keyword If   "${PLATFORM}"=="Android"      Click Choose a number to login android
     ...  ELSE IF    "${PLATFORM}"=="iOS"    Click Choose a number to login ios


Click Choose a number to login android
    Wait Until Keyword Succeeds    30s    2s      Wait Until Page Contains Element    ${ChooseNumber}
    ${Number}=     Get Text     ${ChooseNumber}
    Set Global Variable     ${Number}
    Click Element     ${ChooseNumber}

Click Choose a number to login ios
    Wait Until Keyword Succeeds    40s    2s      Wait Until Page Contains Element    xpath=//XCUIElementTypeCell[@name="099-239-5432"] 
    ${Number}=     Get Text     xpath=//XCUIElementTypeCell[@name="099-239-5432"] 
    Set Global Variable     ${Number}
    Click Element     xpath=//XCUIElementTypeCell[@name="099-239-5432"]     

Verify Login Page
    Run Keyword If   "${PLATFORM}"=="Android"      Verify Login Page android
     ...  ELSE IF    "${PLATFORM}"=="iOS"    Verify Login Page ios

Verify Login Page android
     Wait Until Keyword Succeeds    40s    2s      Wait Until Page Contains Element    ${ToolbarTitle}   
     Mobile element text should be      ${ToolbarTitle}      ${txtToolbarTitle}
     ${NumberProfile}=     Get Text     ${ProfilePhoneNumber}      
     Set Global Variable    ${NumberProfile}
     Should Be String      ${Number}    ${NumberProfile}

Verify Login Page ios
     Wait Until Keyword Succeeds    40s    2s      Wait Until Page Contains Element    xpath=//XCUIElementTypeStaticText[@name="Usage"][1]  
     Mobile element text should be      xpath=//XCUIElementTypeStaticText[@name="Usage"][1]      ${txtToolbarTitle}
     ${NumberProfile}=     Get Text     xpath=//XCUIElementTypeStaticText[@name="099-239-5432"]    
     Set Global Variable    ${NumberProfile}
     Should Be String      xpath=//XCUIElementTypeStaticText[@name="Usage"][1]    ${NumberProfile}

Notification ios
     [Arguments]    ${noti}
     Run Keyword If    "${noti}"=="Allow"    Click Text    ${Allow}
     ...    ELSE IF    "${noti}"=="Don’t Allow"    Click Element   xpath=//XCUIElementTypeButton[@name="Don’t Allow"]  #Click Text    ${Don’t_Allow}

Notification use facebook
     [Arguments]    ${noti}
     Run Keyword If    "${noti}"=="Cancel"    Click Text    ${Cancel}
     ...    ELSE IF    "${noti}"=="Continue"    Click Element    xpath=//XCUIElementTypeButton[@name="Continue"]

Input Account Facebook android
     Wait Until Keyword Succeeds    30s    2s      Wait Until Page Contains Element     ${Loginemail}
     Input Text       ${Loginemail}     ${txtEmail} 
     Input Text       ${Loginpassword}    ${txtpassword}
     Click Element    ${SigninFB}
     Wait Until Keyword Succeeds    30s    2s      Wait Until Page Contains Element    ${Continue}
     Click Element    ${Continue}

Input Account Facebook iOS
     # Input Text    ${fb_user}    pear.panaya@gmail.com
     # Input Text    ${fb_password}    panaya176953
     # Click Element     ${singIn_fb}
     Wait Until Page Contains Element    xpath=//XCUIElementTypeButton[@name="ดำเนินการต่อ"]    #${connectedFB}
     Click Element     xpath=//XCUIElementTypeButton[@name="ดำเนินการต่อ"]   #${connectedFB}

Close All Apps
     Capture Page Screenshot
     Close All Applications
