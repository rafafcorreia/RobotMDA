*** Settings ***
Library    AppiumLibrary

Test Teardown   Close Application

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
Selecionar Sauce Labs Backpack
    Open Application    ${REMOTE_URL}   platformName=${platformName}  appium:platformVersion=${appium:platformVersion}  appium:deviceName=${appium:deviceName}  appium:deviceOrientation=${appium:deviceOrientation}  appium:app=${appium:app}  appium:appPackage=${appium:appPackage}  appium:appActivity=${appium:appActivity}
    
    Element Should Contain Text    id=com.saucelabs.mydemoapp.android:id/productTV    Products
    Click Element    accessibility_id=Sauce Labs Backpack
    Element Should Contain Text    id=com.saucelabs.mydemoapp.android:id/productTV    Sauce Labs Backpack
    Swipe    462    1575    488    553
    Element Should Contain Text    id=com.saucelabs.mydemoapp.android:id/priceTV      $ 29.99
    Click Element    accessibility_id=Tap to add product to cart
    Click Element    id=com.saucelabs.mydemoapp.android:id/cartIV
    Element Should Contain Text     id=com.saucelabs.mydemoapp.android:id/productTV    My Cart
    Element Should Contain Text     id=com.saucelabs.mydemoapp.android:id/titleTV      Sauce Labs Backpack
    Element Should Contain Text     id=com.saucelabs.mydemoapp.android:id/priceTV      $ 29.99
