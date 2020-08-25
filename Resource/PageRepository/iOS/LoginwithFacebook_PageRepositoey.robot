*** Variables ***
${Getstart}   xpath=(//XCUIElementTypeStaticText[@name="welcomepage"])[2]
${Loginphonenumber}    identifier=logintoapp    #xpath=//XCUIElementTypeButton[@name="logintoapp"]
${Loginfacebook_ios}       identifier=loginwithfacebook    #xpath=//XCUIElementTypeButton[@name="loginwithfacebook"]
# ${Termfirst}   id=th.co.crie.tron2.android:id/tv_term_first
# ${Termsecond}    id=th.co.crie.tron2.android:id/tv_term_second
${Term}    identifier=By logging in you agree to our privacy policy & terms of service
${PrepaidSIM}    xpath=//XCUIElementTypeStaticText[@name="Register new prepaid SIM"]    #name=Register new prepaid SIM
${WelcomeFB}   identifier=${txtWelcomeFB}    #xpath=//XCUIElementTypeStaticText[@name="เข้าสู่ระบบบัญชี Facebook ของคุณเพื่อเชื่อมต่อกับ dtac"]
${fb_user}    xpayh=//XCUIElementTypeOther[@name="main"]/XCUIElementTypeTextField
${fb_password}    xpath=//XCUIElementTypeOther[@name="main"]/XCUIElementTypeSecureTextField
${singIn_fb}    identifier=${btssinnginFB}
${connectedFB}    xpath=//XCUIElementTypeButton[@name="${btnconnectedFB}"]    #identifier=${btnconnectedFB}
${AddNumber_btn}    identifier=addphonenumber
${AddNumber}    identifier=phonenumber
${otpbutton}    identifier=otpbutton
${otp_1}    identifier=textfield1
${DoneAddNumber}    identifier=Toolbar Done Button
${ChooseNumber}    xpath=//XCUIElementTypeCell[@name="099-239-5432"]
${Youarenowconnectedwith}    android=UiSelector().text("You are now connected with")
${MydtacNumbers}    android=UiSelector().text("My dtac Numbers")
${AddPhoneNumber}    id=th.co.crie.tron2.android:id/add_phone_number
${Logoutfromthisaccount}    id=th.co.crie.tron2.android:id/facebook_login_button
${ProfilePhoneNumber}   xpath=//XCUIElementTypeStaticText[@name="099-239-5432"]    #id=th.co.crie.tron2.android:id/tvProfilePhoneNumber
${ToolbarTitle}    xpath=//XCUIElementTypeStaticText[@name="Usage"][1]
