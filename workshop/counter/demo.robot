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

*** Keywords ***
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
    
    Sleep    5s
