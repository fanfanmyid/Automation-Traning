*** Settings ***
Library    SeleniumLibrary
Resource    resources/resource.robot
Variables    resources/locator/loginLocator.py

*** Test Cases ***
Successful Login As Standard User
    Given User is logged in to SauceDemo as Standard User
    Then Cart button is visible on the page

Locked Out User Login Shows Error
    Given User tries to log in to SauceDemo as Locked Out User
    Then Error message should be shown

*** Keywords ***
User is logged in to SauceDemo as Standard User
    The user opens the Login Page and logs in as a user    standard_user    secret_sauce    https://www.saucedemo.com

Cart button is visible on the page
    Element Should Be Visible    ${SHOPPING_CART_CONTAINER}

User tries to log in to SauceDemo as Locked Out User
    The user opens the Login Page and logs in as a user    locked_out_user    secret_sauce    https://www.saucedemo.com

Error message should be shown
    Element Should Be Visible    ${ERROR_MESSAGE}
