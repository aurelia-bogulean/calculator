*** Settings ***
Library    SeleniumLibrary

*** Variable ***
${LOGIN URL}    https://web2.0calc.com/
${BROWSER}      Chrome

*** Test Cases ***
Check addition
    Open browser to calculator page
    Type expression      1+5
    Accept cookies
    Press the equal sign
    Result should be     6

Check subtraction
    Press ClearButton
    Type expression     20-7
    Press the equal sign
    Result should be     13

Check multiplication
    Press ClearButton
    Type expression     3*5
    Press the equal sign
    Result should be    15

Check division
    Press ClearButton
    Type expression     14/2
    Press the equal sign
    Result should be    7

    [Teardown]    Close browser

*** Keywords ***
Accept cookies
    Click button     //*[@id="cookieconsentmodal"]/div/div/div/div[1]/div[1]/form/button
    

Open browser to calculator page
    Open browser            ${LOGIN URL}    ${BROWSER}
    Title should be         Web 2.0 scientific calculator

Type expression
     [Arguments]     ${exp}
     Input text      id:input      ${exp}

Press the equal sign
     Click button    id:BtnCalc

Result should be
     [Arguments]    ${expected}
     Element Text should be    id:input, ${expected}

Press ClearButton
     Click button    id:BtnClear

