*** Settings ***
Library    SeleniumLibrary
Resource    resources/pages/loginPage.robot



*** Test Cases ***
User Login Successfully
    Given The user open Login Page
    When The user already see the Login Page
    And The user input username
    And The User input password
    And The user click button login
    Then The user should see the cart button
