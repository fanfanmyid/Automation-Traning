*** Settings ***
Library    SeleniumLibrary
Variables    ../locator/loginLocator.py

*** Variables ***
${URL}    https://www.saucedemo.com
${BROWSER}    Chrome
${USERNAME}    standard_user
${PASSWORD}    secret_sauce

*** Keywords ***
The user open Login Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    0.5s

The user already see the Login Page
    Element Should Be Visible    ${BUTTON_LOGIN}

The user input username
    Input Text    ${EDIT_TEXT_USERNAME}    ${USERNAME}

The user input password
    Input Password    ${EDIT_TEXT_PASSWORD}    ${PASSWORD}

The user click button login
    Click Button    ${BUTTON_LOGIN}

The user should see the cart button
    Element Should Be Visible    ${SHOPPING_CART_CONTAINER} 
