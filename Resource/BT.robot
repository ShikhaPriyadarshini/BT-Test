*** Settings ***
Resource                ..//Locators/Locators.robot

*** Keywords ***

Wait And Click
	[Documentation]    Waits for the element to be visible and clicks on the element.
	 ...   Arguments:
	 ...   1. Locator - The xpath element to be clicked
	 ...   2. Timeout - Timeout for the script to wait for element to be visible. This is optional argument. If it is passed in the argument, it will use the timeout passed in the argument, else it will use the timeout configured in the properties.yaml file
	 ...   Fails if the locator is not visible or if the locator is not interactable.
	 [Arguments]   ${Locator}   ${Timeout}=80    # ${Timeout}=${Wait_Time}
	 Wait Until Element Is Visible   ${Locator}   ${Timeout}    \nFAILED :: Locator ${Locator} is not visible.
	 Wait Until Keyword Succeeds    3x   1 sec    Click Element   ${Locator}

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