*** Settings ***
Library    OperatingSystem

*** Test Cases ***
TRy to read file
	${res}=  Get File   ${CURDIR}/test.txt
	Log to console   ${res}
	Should Be Equal As Strings   sfasdf${\n}sadfasdfas   ${res}
