*** Settings ***
Library    AppiumLibrary

*** Variables ***
${REMOTE_URL}   http://127.0.0.1:4723/wd/hub
${platformName}    Android
${base}   /Users/somkiat/data/slide/appium/workshop/
${app}    ${base}PiggipoGO_1.2.21.apk
${appium:deviceName}    R58M36QKSJK
${appium:automationName}    UiAutomator2

*** Test Cases ***
ลูกค้ามาสมัครใหม่
	เปิด app ใหม่
	สมัครด้วย gmail
	ยอมรับเงื่อนไขต่าง ๆ
	Allow permission
	ผู้ใช้งานจะเข้าหน้าหลักได้

*** Keywords ***
สมัครด้วย gmail
	Wait Until Element Is Visible    id=com.neversitup.piggipogo:id/signInButton
	Click Element    id=com.neversitup.piggipogo:id/signInButton

เปิด app ใหม่
	Open Application    ${REMOTE_URL}   
    ...  platformName=${platformName}  
    ...  appium:app=${app}  
	...  appium:deviceName=${appium:deviceName}  
	...  appium:automationName=${appium:automationName} 

