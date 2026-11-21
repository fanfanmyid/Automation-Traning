*** Settings ***
Library    SeleniumLibrary
Variables    ../locator/loginLocator.py

*** Variables ***
${URL}    https://www.saucedemo.com
${BROWSER}    Chrome
${BROWSER_OPTIONS}    add_argument("--window-size=1920,1080")
${USERNAME}    standard_user
${PASSWORD}    secret_sauce

*** Keywords ***
The user opens the Login Page
    Open Browser    ${URL}    ${BROWSER}    options=${BROWSER_OPTIONS}
    Maximize Browser Window
    Set Selenium Speed    0.5s

The user sees the Login Page
    Element Should Be Visible    ${BUTTON_LOGIN}

The user inputs username
    Input Text    ${EDIT_TEXT_USERNAME}    ${USERNAME}

The user inputs password
    Input Password    ${EDIT_TEXT_PASSWORD}    ${PASSWORD}

The user clicks the login button
    Click Button    ${BUTTON_LOGIN}

The user should see the cart button
    Element Should Be Visible    ${SHOPPING_CART_CONTAINER}
