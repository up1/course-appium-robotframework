*** Settings ***
Library           AppiumFlutterLibrary
Suite Teardown    Close Application

*** Variables ***
${REMOTE_URL}   http://127.0.0.1:4723
${platformName}    Android
${app}    ${CURDIR}/../../demo-app/flutter.apk
${deviceName}    id/name
${automationName}    flutter

*** Test Cases ***
Test case name
        Open Application    ${REMOTE_URL}   
        ...    platformName=${platformName}  
        ...  app=${app}  deviceName=${deviceName}  
        ...  automationName=${automationName} 
        Sleep    5s  # Don't use