***Settings***
Documentation       BasePage
...                 Representa a inicialização do Selenium e demais recursos como ganchos e helpers

Library    OperatingSystem

***Variables***
${base_url}    http://localhost:3000

***Keywords***

## hooks
Open Session
  Open Chrome
  Set Window Size               1440    900
  Set Selenium Implicit Wait    5

Login Session
  [Arguments]     ${email}    ${pass}
  Open Session
  Go To   ${base_url}/login
  LoginPage.Login With    ${email}    ${pass}

Close Session
  Close Browser

Clear Local Storage
  Execute Javascript    localStorage.clear();

After Test
  Capture Page Screenshot

Get Data From Json File
  [Arguments]    ${json_file}
    ${string_file}=      Get File    ${EXECDIR}/resources/fixtures/${json_file}
    ${data_json}=     Evaluate    json.loads($string_file)    json
    [Return]  ${data_json}

## helpers
Open Chrome
  Open Browser       about:blank    chrome    options=add_experimental_option('excludeSwitches', ['enable-logging'])