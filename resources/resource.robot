*** Settings ***
Library    SeleniumLibrary
Variables    locator/loginLocator.py

*** Variables ***
${BROWSER}    Chrome
${BROWSER_OPTIONS}    add_argument("--window-size=1920,1080")

*** Keywords ***
The user opens the Login Page and logs in as a user
    [Arguments]    ${USERNAME}    ${PASSWORD}    ${URL}
    Open Browser    ${URL}    ${BROWSER}    options=${BROWSER_OPTIONS}
    Maximize Browser Window
    Set Selenium Speed    0.5s
    Element Should Be Visible    ${BUTTON_LOGIN}
    Input Text    ${EDIT_TEXT_USERNAME}    ${USERNAME}
    Input Password    ${EDIT_TEXT_PASSWORD}    ${PASSWORD}
    Click Button    ${BUTTON_LOGIN}
