*** Settings ***
Library  AppiumLibrary
Resource  common.resource
Suite Teardown  Close Application

*** Test Cases ***
ตรวจสอบหน้าแรกตอนเปิด app มาใช้งาน
    เปิด app
    ตรวจสอบว่า ค่า counter เป็น 0 แล้วมีปุ่ม + และ - ด้วยนะ

ตรวจสอบหน้าแรกตอนเปิด app มาใช้งาน xxx
    เปิด app
    เพิ่มค่า 2 ครั้ง
    ผลที่ได้มาค่า count = 2

ทำการแก้ไขชื่อ app และค่าเริ่มต้น
    [Tags]  testing  feature01  #robot -i testing demo.robot
    เปิด app
    ทำการแก้ไขชื่อ app เป็น ทดสอบ และ ค่าเริ่มต้นเป็น 20
    ตรวจสอบผลการทำงานในหน้าแรก

*** Variables ***
${name}    me.tsukanov.counter 

*** Keywords ***
ทำการแก้ไขชื่อ app เป็น ทดสอบ และ ค่าเริ่มต้นเป็น 20
    Wait Until Page Contains Element     id=${name}:id/menu_edit
    Click Element    id=${name}:id/menu_edit

    Wait Until Page Contains Element     id=${name}:id/edit_name
    Element Should Be Enabled   id=${name}:id/edit_name
    Element Should Be Enabled   id=${name}:id/edit_value
    Clear Text    id=${name}:id/edit_name
    Input Text    id=${name}:id/edit_name    ทดสอบ
    Clear Text    id=${name}:id/edit_value
    Input Text    id=${name}:id/edit_value    20
    Sleep    5s
    Click Element   id=android:id/button1

ตรวจสอบผลการทำงานในหน้าแรก
    Wait Until Page Contains Element     id=${name}:id/counterLabel
    Element Should Contain Text   id=${name}:id/counterLabel  20

เพิ่มค่า 2 ครั้ง
    Click Element    id=${name}:id/incrementButton
    Click Element    id=${name}:id/incrementButton

ผลที่ได้มาค่า count = 2
    Wait Until Page Contains Element     id=${name}:id/counterLabel
    Element Should Contain Text   id=${name}:id/counterLabel  2
    
ตรวจสอบว่า ค่า counter เป็น 0 แล้วมีปุ่ม + และ - ด้วยนะ
    Wait Until Page Contains Element     id=${name}:id/counterLabel
    Element Should Contain Text   id=${name}:id/counterLabel  0
    Element Should Be Visible    id=${name}:id/incrementButton
    Element Should Be Visible    id=${name}:id/decrementButton

เปิด app
    Open Application    ${REMOTE_URL}   platformName=${platformName}  
    ...  appium:app=${appium:app}  appium:deviceName=${appium:deviceName}  
    ...  appium:automationName=${appium:automationName}  
    ...  appium:ensureWebviewsHavePages=${appium:ensureWebviewsHavePages}  
    ...  appium:nativeWebScreenshot=${appium:nativeWebScreenshot}  
    ...  appium:newCommandTimeout=${appium:newCommandTimeout}  
    ...  appium:connectHardwareKeyboard=${appium:connectHardwareKeyboard}
    
