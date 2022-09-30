*** Settings ***
Library   AppiumLibrary
Suite Teardown   Close Application

*** Variables ***
${ANDROID_AUTOMATION_NAME}    UIAutomator2
${ANDROID_APP}                ${CURDIR}/PiggipoGO_1.2.21.apk
${ANDROID_PLATFORM_NAME}      Android

*** Test Cases ***
Login Flow
	Open App
	Choose gmail account
	Accept terms of service and private policy
	See page welcome to Piggipo Go

*** Keywords ***
Open App
	Open Application  http://127.0.0.1:4723/wd/hub  automationName=${ANDROID_AUTOMATION_NAME}
    ...  platformName=${ANDROID_PLATFORM_NAME} 
    ...  app=${ANDROID_APP}  appPackage=com.neversitup.piggipogo

Choose gmail account
	Wait Until Element Is Visible  id=com.neversitup.piggipogo:id/signInButton
	Click Element    id=com.neversitup.piggipogo:id/signInButton
	Wait Until Element Is Visible  id=com.google.android.gms:id/account_display_name
	Click Element  id=com.google.android.gms:id/account_display_name

Accept terms of service and private policy
	Wait Until Element Is Visible    id=com.neversitup.piggipogo:id/btnTermAccept
	Click Element    id=com.neversitup.piggipogo:id/btnTermAccept
	Wait Until Element Is Visible   id=com.neversitup.piggipogo:id/cb
	Click Element    id=com.neversitup.piggipogo:id/cb
	Wait Until Element Is Visible   id=com.neversitup.piggipogo:id/btnPolicyAccept
	Click Element    id=com.neversitup.piggipogo:id/btnPolicyAccept

See page welcome to Piggipo Go
	Wait Until Element Is Visible   id=com.android.permissioncontroller:id/permission_allow_button
	Click Element    id=com.android.permissioncontroller:id/permission_allow_button
	Wait Until Element Is Visible  id=com.neversitup.piggipogo:id/imvAds2
	Click Element    id=com.neversitup.piggipogo:id/imvAds
