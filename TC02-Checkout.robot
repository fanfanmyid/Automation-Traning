*** Settings ***
Library    SeleniumLibrary
Resource    resources/resource.robot
Variables    resources/locator/loginLocator.py

*** Variables ***

*** Test Cases ***
Success Login As Standard Users
    Given User Already Login in SauceLabs as Standard User
    Then Cart Button Already Showing in Page

Success Logn as Lockout Users
    Given User Already Login in SauceLabs as Lockout User 
    Then Error message will shown 
    
*** Keywords ***
User Already Login in SauceLabs as Standard User
    The user open Login Page and Login As a Standrard Users    standard_user    secret_sauce    https://www.saucedemo.com

Cart Button Already Showing in Page
    Element Should Be Visible    ${SHOPPING_CART_CONTAINER}

User Already Login in SauceLabs as Lockout User
    The user open Login Page and Login As a Standrard Users    locked_out_user    secret_sauce    https://www.saucedemo.com
    
Error message will shown
    Element Should Be Visible    ${ERROR_MESSAGE}