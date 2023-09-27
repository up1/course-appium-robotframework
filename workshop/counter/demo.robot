*** Settings ***
Library           AppiumLibrary
Suite Teardown    Close Application

*** Variables ***
${REMOTE_URL}   http://127.0.0.1:4723
${platformName}    Android
${appium:app}    ${CURDIR}/../../demo-app/counter.apk
${appium:deviceName}    id/name
${appium:automationName}    UiAutomator2
${appium:ensureWebviewsHavePages}    true
${appium:nativeWebScreenshot}    true
${appium:newCommandTimeout}    3600
${appium:connectHardwareKeyboard}    true

*** Test Cases ***
Test case name
        Open Application    ${REMOTE_URL}   platformName=${platformName}  appium:app=${appium:app}  appium:deviceName=${appium:deviceName}  appium:automationName=${appium:automationName}  appium:ensureWebviewsHavePages=${appium:ensureWebviewsHavePages}  appium:nativeWebScreenshot=${appium:nativeWebScreenshot}  appium:newCommandTimeout=${appium:newCommandTimeout}  appium:connectHardwareKeyboard=${appium:connectHardwareKeyboard}
