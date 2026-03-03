*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Open Browser With Chrome Options
    [Arguments]    ${url}    ${headless}=False
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    Run Keyword If    ${headless}    Call Method    ${options}    add_argument    --headless
    Open Browser    ${url}    Chrome    options=${options}
    Wait Until Page Contains Element    body    timeout=${TIMEOUT}

Open Website And Verify Load
    [Arguments]    ${url}    ${browser}=Chrome
    Open Browser    ${url}    ${browser}
    Wait Until Page Contains Element    body    timeout=${TIMEOUT}

Verify Page Title
    [Arguments]    ${expected_title}
    Title Should Be    ${expected_title}

Close All Browsers And Report
    Close All Browsers
    Log    Test execution completed
