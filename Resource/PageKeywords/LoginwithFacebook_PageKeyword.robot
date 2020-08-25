*** Settings ***
Library           AppiumLibrary
Library           String
Resource          ../../Resource/PageRepository/${ar_OS}/LoginwithFacebook_PageRepositoey.robot
Resource          ../../Resource/PageRepository/${ar_OS}/LoginwithFacebook_PageRepositoey.yaml
Resource          ../../Resource/PageLocaillized/LoginwithFacebook_PageLocailized.robot
Resource          ../../Resource/PageKeywords/MyCommon.robot


*** Variables ***
${REMOTE_URL}     http://localhost:4723/wd/hub      # URL to appium server
${PLATFORM_NAME}    iOS   #Android    #iOS
${PLATFORM_VERSION}   13.6   #8.0.0   #12.4.8   #13.5
${DEVICE_NAME}    iPhone 11   #Galaxy S7  #iPhone 6_test
#Appium uses the *.app directory that is created by the ios build to provision the emulator.
${APP_LOCATION}        /Users/pearbum/Library/Developer/Xcode/DerivedData/dtac-iservice-dxzezdkyaqxnighaygfzafduqntd/Build/Products/Debug-iphonesimulator/dtac.app
${BUNDLE_ID}         th.co.crie.dtacservices    #com.mock.HelloWorld
${APP_PACKAGE}    th.co.crie.tron2.android  
${APP_ACTIVITY}       th.co.dtac.function.SplashScreenActivity
${PLATFORM}     ${ar_OS}


*** Keywords ***
Open App 
     Run Keyword If    "${PLATFORM}"=="Android"    Android Open app
     ...    ELSE IF     "${PLATFORM}"=="iOS"   iOS Open App
     
Android Open app
     Open Application    ${REMOTE_URL}    platformName=${PLATFORM_NAME}    platformVersion=${PLATFORM_VERSION}    deviceName=${DEVICE_NAME}    appPackage=${APP_PACKAGE}    appActivity=${APP_ACTIVITY}

iOS Open App     
     Open Application    ${REMOTE_URL}    platformName=${PLATFORM_NAME}    platformVersion=${PLATFORM_VERSION}
      ...    deviceName=${DEVICE_NAME}      app=${APP_LOCATION}     bundleId=${BUNDLE_ID}
     Notification ios    ${Don’t_Allow}

Click Signin with Feacbook
     Run Keyword If    "${ar_OS}"=="Android"    Click Signin with Feacbook Android
     ...    ELSE IF    "${ar_OS}"=="iOS"    Click Signin with Feacbook ios

Click Signin with Feacbook ios
    Wait Until Keyword Succeeds    30s    2s      Wait Until Page Contains Element     ${Loginfacebook_ios}
    Click Element     ${Loginfacebook_ios}
    Notification use facebook    ${Continue}
    Login facebook

Click Signin with Feacbook Android
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

Notification ios
     [Arguments]    ${noti}
     Run Keyword If    "${noti}"=="Allow"    Click Text    ${Allow}
     ...    ELSE IF    "${noti}"=="Don’t Allow"    Click Text    ${Don’t_Allow}

Notification use facebook
     [Arguments]    ${noti}
     Run Keyword If    "${noti}"=="Cancel"    Click Text    ${Cancel}
     ...    ELSE IF    "${noti}"=="Continue"    Click Text    ${Continue}

Login facebook
     # Input Text    ${fb_user}    pear.panaya@gmail.com
     # Input Text    ${fb_password}    panaya176953
     # Click Element     ${singIn_fb}
     Wait Until Page Contains Element    ${connectedFB}
     Click Element     ${connectedFB}
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
