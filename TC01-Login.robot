*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${URL}    https://www.saucedemo.com
${BROWSER}    Chrome
${USERNAME}    standard_user
${PASSWORD}    secret_sauce


*** Test Cases ***
User Login Successfully
    Given The user open Login Page
    When The user already see the Login Page
    And The user input username
    And The User input password
    And The user click button login
    Then The user should see the cart button


*** Keywords ***
The user open Login Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

The user already see the Login Page
    Element Should Be Visible    id:login-button

The user input username
    Input Text    id:user-name    ${USERNAME}

The user input password
    Input Password    id:password    ${PASSWORD}

The user click button login
    Click Button    id:login-button

The user should see the cart button
    Element Should Be Visible    id:shopping_cart_container    