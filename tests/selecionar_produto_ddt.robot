*** Settings ***
Library    AppiumLibrary

Suite Setup    Open Application    ${REMOTE_URL}   platformName=${platformName}  appium:platformVersion=${appium:platformVersion}  appium:deviceName=${appium:deviceName}  appium:deviceOrientation=${appium:deviceOrientation}  appium:app=${appium:app}  appium:appPackage=${appium:appPackage}  appium:appActivity=${appium:appActivity}
Test Teardown    Remover produto do carrinho e retornar para Home
Suite Teardown   Close Application

Test Template    Selecionar produto

*** Variables ***
${REMOTE_URL}      https://InstrutorIterasys22:%{SAUCE_ACCESS_KEY}@ondemand.us-west-1.saucelabs.com:443/wd/hub
${platformName}    Android
${appium:platformVersion}    9.0
${appium:deviceName}    Samsung Galaxy S9 FHD GoogleAPI Emulator
${appium:deviceOrientation}    portrait
${appium:app}    storage:filename=mda-2.0.1-22.apk
${appium:appPackage}    com.saucelabs.mydemoapp.android
${appium:appActivity}    com.saucelabs.mydemoapp.android.view.activities.SplashActivity


*** Test Cases ***
TC001    Sauce Labs Backpack    $ 29.99    0
TC002    Sauce Labs Bike Light    $ 9.99    0
TC003    Sauce Labs Bolt T-Shirt    $ 15.99    0
TC004    Sauce Labs Fleece Jacket    $ 49.99    0
TC005    Sauce Labs Onesie    $ 7.99    1
TC006    Test.sllTheThings() T-Shirt    $ 15.99    1

*** Keywords ***
Selecionar produto
    [Arguments]    ${product_name}    ${product_price}    ${swipe_count}
    Element Text Should Be    id=com.saucelabs.mydemoapp.android:id/productTV    Products
    FOR    ${index}    IN RANGE    ${swipe_count}
        Swipe    462    1575    488    553
    END
    Click Element    accessibility_id=${product_name}
    Element Text Should Be    id=com.saucelabs.mydemoapp.android:id/productTV    ${product_name}
    Swipe    462    1575    488    553
    Element Text Should Be    id=com.saucelabs.mydemoapp.android:id/priceTV      ${product_price}
    Click Element    accessibility_id=Tap to add product to cart
    Click Element    id=com.saucelabs.mydemoapp.android:id/cartIV
    Element Text Should Be     id=com.saucelabs.mydemoapp.android:id/productTV    My Cart
    Element Text Should Be     id=com.saucelabs.mydemoapp.android:id/titleTV      ${product_name}
    Element Text Should Be     id=com.saucelabs.mydemoapp.android:id/priceTV      ${product_price}

Remover produto do carrinho e retornar para Home
    Click Element    id=com.saucelabs.mydemoapp.android:id/removeBt
    Click Element    id=com.saucelabs.mydemoapp.android:id/menuIV
    Click Element    xpath=//androidx.recyclerview.widget.RecyclerView[@content-desc="Recycler view for menu"]/android.view.ViewGroup[1]/android.widget.TextView[2]
