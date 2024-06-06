*** Settings ***
Library    AppiumLibrary

*** Variables ***
${REMOTE_URL_LOCAL}        http://127.0.0.1:4723
${REMOTE_URL_SAUCE_LABS}        https://InstrutorIterasys22:%{SAUCE_ACCESS_KEY}@ondemand.us-west-1.saucelabs.com:443/wd/hub
${platformName}    Android
${appium:automationName}    uiautomator2
${appium:platformVersion}    9.0
${appium:deviceNameLocal}    emulator-5554
${appium:deviceNameSauceLabs}    Samsung Galaxy S9 FHD GoogleAPI Emulator
${appium:deviceOrientation}    portrait
${appium:app}    storage:filename=mda-2.0.1-22.apk
${appium:appPackage}    com.saucelabs.mydemoapp.android
${appium:appActivity}    com.saucelabs.mydemoapp.android.view.activities.SplashActivity

*** Keywords ***
Local Open Application
    Open Application    ${REMOTE_URL_LOCAL}   platformName=${platformName}  appium:platformVersion=${appium:platformVersion}  appium:deviceName=${appium:deviceNameLocal}  appium:deviceOrientation=${appium:deviceOrientation}  appium:appPackage=${appium:appPackage}  appium:appActivity=${appium:appActivity}  appium:automationName=${appium:automationName}

Sauce Labs Open Application
    Open Application    ${REMOTE_URL_SAUCE_LABS}   platformName=${platformName}  appium:platformVersion=${appium:platformVersion}  appium:deviceName=${appium:deviceNameSauceLabs}  appium:deviceOrientation=${appium:deviceOrientation}  appium:app=${appium:app}  appium:appPackage=${appium:appPackage}  appium:appActivity=${appium:appActivity}

Swipe Up
    Swipe    462    1575    488    553