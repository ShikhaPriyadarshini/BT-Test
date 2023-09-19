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
${Browser}         Chrome       executable_path=Configuration/chromedriver.exe

*** Test Cases ***
BT_TC1    [Documentation]    Open Browser     https://www.bt.com/     ${Browser}
    wait until page contains    ${BT_URL}
    maximize browser window
    Wait and click   ${Mobile}
    wait and click   ${Mobile_Phones}
    ${Count}    Banner Count
    wait and click   ${View_Sim}
    title should be     SIM Only Deals | Compare SIMO Plans & Contracts | BT Mobile
    Validate Deals
    close browser
