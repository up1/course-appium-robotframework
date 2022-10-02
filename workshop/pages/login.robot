*** Keywords ***
Sign in with Google
	Wait Until Element Is Visible  id=com.neversitup.piggipogo:id/signInButton
	Click Element    id=com.neversitup.piggipogo:id/signInButton
	Wait Until Element Is Visible  id=com.google.android.gms:id/account_display_name
	Click Element  id=com.google.android.gms:id/account_display_name

Sign in with Facebook
	Wait Until Element Is Visible  id=com.neversitup.piggipogo:id/signInButton
	Click Element    id=com.neversitup.piggipogo:id/signInButton
	Wait Until Element Is Visible  id=com.google.android.gms:id/account_display_name
	Click Element  id=com.google.android.gms:id/account_display_name

Check label 1 2 3
	Wait Until Element Is Visible  id=com.neversitup.piggipogo:id/signInButton
	Wait Until Element Is Visible  id=com.neversitup.piggipogo:id/signInButton
	Wait Until Element Is Visible  id=com.neversitup.piggipogo:id/signInButton