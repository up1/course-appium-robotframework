*** Settings ***
Library           AppiumLibrary
Suite Teardown    Close Application

*** Variables ***
${REMOTE_URL}   http://127.0.0.1:4723
${platformName}    Android
${appium:app}    /Users/somkiatpuisungnoen/data/slide/appium/2023/course-appium-robotframework/demo-app/counter.apk
${appium:deviceName}    id/name
${appium:automationName}    UiAutomator2
${appium:ensureWebviewsHavePages}    true
${appium:nativeWebScreenshot}    true
${appium:newCommandTimeout}    3600
${appium:connectHardwareKeyboard}    true

*** Test Cases ***
ตรวจสอบหน้าแรกตอนเปิด app มาใช้งาน
    เปิด app
    ตรวจสอบว่า ค่า counter เป็น 0 แล้วมีปุ่ม + และ - ด้วยนะ

ตรวจสอบหน้าแรกตอนเปิด app มาใช้งาน
    เปิด app
    เพิ่มค่า 2 ครั้ง
    ผลที่ได้มาค่า count = 2

ทำการแก้ไขชื่อ app และค่าเริ่มต้น
    [Tags]  testing
    เปิด app
    ทำการแก้ไขชื่อ app เป็น ทดสอบ และ ค่าเริ่มต้นเป็น 20
    ตรวจสอบผลการทำงานในหน้าแรก

*** Keywords ***
ทำการแก้ไขชื่อ app เป็น ทดสอบ และ ค่าเริ่มต้นเป็น 20
    Wait Until Page Contains Element     id=me.tsukanov.counter:id/menu_edit
    Click Element    id=me.tsukanov.counter:id/menu_edit

    Wait Until Page Contains Element     id=me.tsukanov.counter:id/edit_name
    Element Should Be Enabled   id=me.tsukanov.counter:id/edit_name
    Element Should Be Enabled   id=me.tsukanov.counter:id/edit_value
    Clear Text    id=me.tsukanov.counter:id/edit_name
    Input Text    id=me.tsukanov.counter:id/edit_name    ทดสอบ
    Clear Text    id=me.tsukanov.counter:id/edit_value
    Input Text    id=me.tsukanov.counter:id/edit_value    20
    Sleep    5s
    Click Element   id=android:id/button1

ตรวจสอบผลการทำงานในหน้าแรก
    Wait Until Page Contains Element     id=me.tsukanov.counter:id/counterLabel
    Element Should Contain Text   id=me.tsukanov.counter:id/counterLabel  20

เพิ่มค่า 2 ครั้ง
    Click Element    id=me.tsukanov.counter:id/incrementButton
    Click Element    id=me.tsukanov.counter:id/incrementButton

ผลที่ได้มาค่า count = 2
    Wait Until Page Contains Element     id=me.tsukanov.counter:id/counterLabel
    Element Should Contain Text   id=me.tsukanov.counter:id/counterLabel  2
    
ตรวจสอบว่า ค่า counter เป็น 0 แล้วมีปุ่ม + และ - ด้วยนะ
    Wait Until Page Contains Element     id=me.tsukanov.counter:id/counterLabel
    Element Should Contain Text   id=me.tsukanov.counter:id/counterLabel  0
    Element Should Be Visible    id=me.tsukanov.counter:id/incrementButton
    Element Should Be Visible    id=me.tsukanov.counter:id/decrementButton

เปิด app
    Open Application    ${REMOTE_URL}   platformName=${platformName}  
    ...  appium:app=${appium:app}  appium:deviceName=${appium:deviceName}  
    ...  appium:automationName=${appium:automationName}  
    ...  appium:ensureWebviewsHavePages=${appium:ensureWebviewsHavePages}  
    ...  appium:nativeWebScreenshot=${appium:nativeWebScreenshot}  
    ...  appium:newCommandTimeout=${appium:newCommandTimeout}  
    ...  appium:connectHardwareKeyboard=${appium:connectHardwareKeyboard}
    
