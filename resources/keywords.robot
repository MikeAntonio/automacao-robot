*** Settings ***
Library    SeleniumLibrary


*** Keywords ***
Open Website And Verify Load
    [Arguments]    ${url}
    Open Browser    ${url}    ${BROWSER}
    Wait Until Page Contains Element    body    timeout=${TIMEOUT}

Verify Page Title
    [Arguments]    ${expected_title}
    Title Should Be    ${expected_title}

Close All Browsers And Report
    Close All Browsers
    Log    Test execution completed
