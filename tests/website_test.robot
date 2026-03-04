*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/keywords.robot
Resource    ../resources/variables.robot

Suite Setup    Open Browser With Chrome Options    ${BASE_URL}    ${HEADLESS}
Suite Teardown    Close All Browsers


*** Test Cases ***
Test Website Access Success
    [Documentation]    Verifica se o site carrega com sucesso
    Page Should Contain    httpbin
    Title Should Contain    httpbin

Test Page Contains Expected Elements
    [Documentation]    Verifica se a página contém elementos esperados
    Wait Until Page Contains    httpbin.org    timeout=10s
    Element Should Be Visible    tag:html
