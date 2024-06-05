*** Settings ***
Library    AppiumLibrary
Resource    ../resources/capabilities.resource

Suite Setup    Local Open Application
Test Teardown    Remover produto do carrinho e retornar para Home
Suite Teardown   Close Application

Test Template    Selecionar produto

*** Test Cases ***
TC001    Sauce Labs Backpack    $ 29.99    0
# TC002    Sauce Labs Bike Light    $ 9.99    0
TC003    Sauce Labs Bolt T-Shirt    $ 15.99    0
TC004    Sauce Labs Fleece Jacket    $ 49.99    0
TC005    Sauce Labs Onesie    $ 7.99    1
TC006    Test.sllTheThings() T-Shirt    $ 15.99    1

*** Keywords ***
Selecionar produto
    [Arguments]    ${product_name}    ${product_price}    ${swipe_count}
    Wait Until Element Is Visible    id=com.saucelabs.mydemoapp.android:id/productTV    10000ms
    Element Text Should Be    id=com.saucelabs.mydemoapp.android:id/productTV    Products
    FOR    ${index}    IN RANGE    ${swipe_count}
        Swipe Up
    END
    Click Element    accessibility_id=${product_name}
    Sleep    500ms
    Element Text Should Be    id=com.saucelabs.mydemoapp.android:id/productTV    ${product_name}
    Swipe Up
    Element Text Should Be    id=com.saucelabs.mydemoapp.android:id/priceTV      ${product_price}
    Click Element    accessibility_id=Tap to add product to cart
    Click Element    id=com.saucelabs.mydemoapp.android:id/cartIV
    Wait Until Element Is Visible    id=com.saucelabs.mydemoapp.android:id/productTV    10000ms
    Element Text Should Be     id=com.saucelabs.mydemoapp.android:id/productTV    My Cart
    Element Text Should Be     id=com.saucelabs.mydemoapp.android:id/titleTV      ${product_name}
    Element Text Should Be     id=com.saucelabs.mydemoapp.android:id/priceTV      ${product_price}

Remover produto do carrinho e retornar para Home
    Click Element    id=com.saucelabs.mydemoapp.android:id/removeBt
    Click Element    id=com.saucelabs.mydemoapp.android:id/menuIV
    Click Element    xpath=//androidx.recyclerview.widget.RecyclerView[@content-desc="Recycler view for menu"]/android.view.ViewGroup[1]/android.widget.TextView[2]
