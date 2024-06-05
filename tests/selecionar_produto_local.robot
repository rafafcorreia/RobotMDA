*** Settings ***
Library    AppiumLibrary
Resource    ../resources/capabilities.resource

Test Setup    Local Open Application
Test Teardown   Close Application

*** Test Cases ***
Selecionar Sauce Labs Backpack
    Wait Until Element Is Visible    id=com.saucelabs.mydemoapp.android:id/productTV    10000ms
    Element Text Should Be    id=com.saucelabs.mydemoapp.android:id/productTV    Products
    Click Element    accessibility_id=Sauce Labs Backpack
    Element Text Should Be    id=com.saucelabs.mydemoapp.android:id/productTV    Sauce Labs Backpack
    Swipe Up
    Element Text Should Be    id=com.saucelabs.mydemoapp.android:id/priceTV      $ 29.99
    Click Element    accessibility_id=Tap to add product to cart
    Click Element    id=com.saucelabs.mydemoapp.android:id/cartIV
    Element Text Should Be     id=com.saucelabs.mydemoapp.android:id/productTV    My Cart
    Element Text Should Be     id=com.saucelabs.mydemoapp.android:id/titleTV      Sauce Labs Backpack
    Element Text Should Be     id=com.saucelabs.mydemoapp.android:id/priceTV      $ 29.99
