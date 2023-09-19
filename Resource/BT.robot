*** Settings ***
Resource                ..//Locators/Locators.robot

*** Keywords ***

Go To BT Home
	Log And Log To Console  \n Navigating to BT
    switch browser  BT
    Terminate Browsers    [Documentation]   This keyword will kill the browser and terminate the browser process.
    [Timeout]   5 seconds
    Close All Browsers

Banner Count
	[Documentation]  This keyword will count the banner.
	${count} =  Get Element Count   ${Banner_Class}
    Should Be True  ${count} >= 3
    [Return]  ${count}

Validate Deals
	[Documentation]  This keyword will validate the sim only deals
	${deals}     run keyword and return status       wait until element is visible       ${Deals}