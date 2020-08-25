*** Variables ***
${Getstart}   id=th.co.crie.tron2.android:id/tv_label_get_start
${Loginphonenumber}    id=th.co.crie.tron2.android:id/btn_login_phone_number
${Loginfacebook}       xpath=//android.widget.LinearLayout[contains(@resource-id,'btn_login_facebook')]    #id=th.co.crie.tron2.android:id/btn_login_facebook
${Termfirst}   id=th.co.crie.tron2.android:id/tv_term_first
${Termsecond}    id=th.co.crie.tron2.android:id/tv_term_second
${PrepaidSIM}    id=th.co.crie.tron2.android:id/tv_prepaid
${ChooseNumber}    xpath=//android.widget.TextView[contains(@resource-id,'sub_item_subnum')]    #id=th.co.crie.tron2.android:id/sub_item_subnum
${Youarenowconnectedwith}    android=UiSelector().text("You are now connected with")
${MydtacNumbers}    android=UiSelector().text("My dtac Numbers")
${AddPhoneNumber}    id=th.co.crie.tron2.android:id/add_phone_number
${Logoutfromthisaccount}    id=th.co.crie.tron2.android:id/facebook_login_button
${ProfilePhoneNumber}   xpath=//android.widget.TextView[contains(@resource-id,'tvProfilePhoneNumber')]    #id=th.co.crie.tron2.android:id/tvProfilePhoneNumber
${ToolbarTitle}    xpath=//android.widget.TextView[contains(@resource-id,'tvToolbarTitle')]    #id=th.co.crie.tron2.android:id/tvToolbarTitle
${Loginemail}    xpath=//android.widget.EditText[contains(@resource-id,'m_login_email')]  #id=m_login_email
${Loginpassword}    xpath=//android.widget.EditText[contains(@resource-id,'m_login_password')]   #id=m_login_password
${SigninFB}    xpath=//android.view.View[contains(@resource-id,'u_0_4')]
${NotSave}    xpath=//android.widget.Button[contains(@resource-id,'autofill_save_no')]    
${Continue}    android=UiSelector().text("ดำเนินการต่อ")    #xpath=//android.widget.Button[contains(@resource-id,'u_0_1')]