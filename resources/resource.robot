*** Settings ***
Library    SeleniumLibrary
Variables    locator/loginLocator.py

*** Variables ***
${BROWSER}    Chrome

*** Keywords ***
The user open Login Page and Login As a Standrard Users
    [Arguments]    ${USERNAME}    ${PASSWORD}    ${URL}
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    0.5s
    Element Should Be Visible    ${BUTTON_LOGIN}
    Input Text    ${EDIT_TEXT_USERNAME}    ${USERNAME}
    Input Password    ${EDIT_TEXT_PASSWORD}    ${PASSWORD}
    Click Button    ${BUTTON_LOGIN}
    # Element Should Be Visible    ${SHOPPING_CART_CONTAINER}
