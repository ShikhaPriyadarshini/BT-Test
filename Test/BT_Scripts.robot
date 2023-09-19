*** Settings ***
Library                 RequestsLibrary
Library                 JSONLibrary
Library                 String
Library                 Collections
Library                 OperatingSystem
Library                 SeleniumLibrary
Resource                ..//Resource/BT.robot
Resource                ..//Locators/Locators.robot
Variables               ..//Properties.yaml
#Suite Teardown          Terminate Browser

*** Variables ***
${BT_URL}          https://www.bt.com/
#${Browser}         Chrome       executable_path=Configuration/chromedriver.exe

*** Test Cases ***
BT_TC1    [Documentation]    Open Browser     https://www.bt.com/     browser=Chrome     executable_path=Configuration/chromedriver.exe    Wait Until Page Contains    ${BT_URL}
    maximize browser window
    Wait And Click      ${Cookies}
    Wait And Click   ${Mobile}
    Wait And Click   ${Mobile_Phones}
    ${Count}    Banner Count
    Wait And Click   ${View_Sim}
    Title Should Be     SIM Only Deals | Compare SIMO Plans & Contracts | BT Mobile    Validate Deals
