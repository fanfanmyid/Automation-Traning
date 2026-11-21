*** Settings ***
Library    SeleniumLibrary
Resource    resources/pages/loginPage.robot

*** Test Cases ***
User Login Successfully
    Given The user opens the Login Page
    When The user sees the Login Page
    And The user inputs username
    And The user inputs password
    And The user clicks the login button
    Then The user should see the cart button
