*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/keywords.robot
Resource    ../resources/variables.robot

Suite Setup    Open Browser    ${BASE_URL}    ${BROWSER}
Suite Teardown    Close Browser


*** Test Cases ***
Test Website Access Success
    [Documentation]    Verifica se o site carrega com sucesso
    Title Should Be    Google
    Page Should Contain Element    css:form

Test Search Functionality
    [Documentation]    Testa a funcionalidade de busca
    Input Text    name:q    Robot Framework
    Press Keys    name:q    Return
    Wait Until Page Contains    Robot Framework
