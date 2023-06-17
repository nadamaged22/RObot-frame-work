*** Settings ***
Library           SeleniumLibrary
Library           String
Library           BuiltIn

*** Variables ***
${first_movie}    xpath=//*[@id="main"]/div/span/div/div/div[3]/table/tbody/tr[1]/td[2]
${test_case1_first_movie}    //*[@id="__next"]/main/div[2]/div[3]/section/div/div[1]/section[2]/div[2]/ul/li[1]/div[2]/div/a
${generic}        xpath=//*[@id="main"]/div/div[3]/div/div[1]/div[3]/p[1]/span[5]
${class_details}    xpath=//*[@id="main"]/div/div[3]
${year}           //*[@id="main"]/div/div[3]/div/div[1]/div[3]/h3/span[2]
${yearCounter}    ${EMPTY}

*** Test Cases ***
TestCase1
    Open Browser    https://www.imdb.com/    chrome
    Maximize Browser Window
    Input Text    //*[@id="suggestion-search"]    The Shawshank Redemption
    Click Button    //*[@id="suggestion-search-button"]
    ${movie}    Get Text    ${test_case1_first_movie}
    Should Contain    ${movie}    The Shawshank Redemption
    close browser

testcase2
    Open Browser    https://www.imdb.com/    chrome
    Maximize Browser Window
    Click Element    //*[@id="iconContext-menu"]
    sleep    1
    Click Link    Top 250 Movies
    sleep    1
    ${movie}    Get Text    ${first_movie}
    Should Contain    ${movie}    The Shawshank Redemption
    close browser

testCase3
    open browser    https://www.imdb.com/    chrome
    Maximize Browser Window
    Click element    //*[@id="nav-search-form"]/div[1]/div/label
    sleep    2
    Click Link    Advanced Search
    sleep    1
    Click Link    Advanced Title Search
    sleep    1
    click element    //*[@id="main"]/div[2]/div[2]/table/tbody/tr[1]/td[1]/label
    click element    //*[@id="main"]/div[6]/div[2]/table/tbody/tr[1]/td[1]/label
    input Text    //*[@id="main"]/div[3]/div[2]/input[1]    2010
    input Text    //*[@id="main"]/div[3]/div[2]/input[2]    2020
    sleep    1
    click element    //*[@id="main"]/div[25]/div/select[3]
    sleep    1
    click element    //*[@id="main"]/div[25]/div/select[3]/option[6]
    sleep    1
    click button    //*[@id="main"]/p[3]/button
    FOR    ${generic}    IN    ${class_details}
        ${type}    Get Text    ${generic}
        Should Contain    ${type}    Action
    END
    sleep    1
    close browser
