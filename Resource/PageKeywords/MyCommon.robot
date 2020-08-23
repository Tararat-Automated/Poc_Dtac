*** Settings ***
Library           AppiumLibrary
Resource          ../../Resource/PageRepository/Android/LoginwithFacebook_PageRepositoey.robot


*** Variables ***
${status_TRUE}    true
${status_FAIL}    fail

*** Keywords ***
Mobile element text should be
    [Arguments]    ${Element}    ${expected}  
    Wait Until Keyword Succeeds    10s    2s    Page Should Contain Element    ${Element}
    ${actual}=    Get Text    ${Element}
    Should Be Equal    ${actual}    ${expected}
    Log    Expected '${expected}' and Actual '${actual}' result

Swipe Down
    ${element_size}=    Get Element Size    ${ELEMENT_ID}    #id=com.scb.phone:id/fragment_transfer_tab
    ${element_location}=    Get Element Location    id=com.scb.phone:id/fragment_transfer_tab
    ${start_x}=         Evaluate      ${element_location['x']} + (${element_size['width']} * 0.5)
    ${start_y}=         Evaluate      ${element_location['y']} + (${element_size['height']} * 0.3)
    ${end_x}=           Evaluate      ${element_location['x']} + (${element_size['width']} * 0.5)
    ${end_y}=           Evaluate      ${element_location['y']} + (${element_size['height']} * 0.7)
    Swipe     ${start_x}    ${start_y}    ${end_x}    ${end_y}    500  
    Sleep  1

Swipe Up Bank
    Sleep  1 
    ${element_size}=    Get Element Size    ${ELEMENT_IDิิิิbank}      #id=com.scb.phone:id/fragment_transfer_tab
    ${element_location}=    Get Element Location    ${ELEMENT_IDิิิิbank}      #id=com.scb.phone:id/fragment_transfer_tab
    ${start_x}=         Evaluate      ${element_location['x']} + (${element_size['width']} * 0.5)
    ${start_y}=         Evaluate      ${element_location['y']} + (${element_size['height']} * 0.7)
    ${end_x}=           Evaluate      ${element_location['x']} + (${element_size['width']} * 0.5)
    ${end_y}=           Evaluate      ${element_location['y']} + (${element_size['height']} * 0.3)
    Swipe               ${start_x}    ${start_y}    ${end_x}    ${end_y}    500
    Sleep  1      

Swipe Up Slip
    Sleep  1 
    ${element_size}=    Get Element Size    ${ELEMENT_IDslip}      #id=com.scb.phone:id/fragment_transfer_tab
    ${element_location}=    Get Element Location    ${ELEMENT_IDslip}      #id=com.scb.phone:id/fragment_transfer_tab
    ${start_x}=         Evaluate      ${element_location['x']} + (${element_size['width']} * 0.5)
    ${start_y}=         Evaluate      ${element_location['y']} + (${element_size['height']} * 0.7)
    ${end_x}=           Evaluate      ${element_location['x']} + (${element_size['width']} * 0.5)
    ${end_y}=           Evaluate      ${element_location['y']} + (${element_size['height']} * 0.3)
    Swipe               ${start_x}    ${start_y}    ${end_x}    ${end_y}    500
    Sleep  1      


