***Settings***
Documentation       BasePage
...                 Representa a inicialização do Selenium e demais recursos como ganchos e helpers

***Variables***
${base_url}    http://pixel-web:3000

***Keywords***

## hooks
Open Session
  Run Keyword If    "${browser}" == "chrome"
  ...               Open Chrome

  Run Keyword If    "${browser}" == "headless"
  ...               Open Chrome Headless

  Set Window Size               1440    900
  Set Selenium Implicit Wait    10

Login Session
  [Arguments]     ${email}    ${pass}
  Open Session
  Go To   ${base_url}/login
  LoginPage.Login With    ${email}    ${pass}

Products Page
  Go To   ${base_url}/admin/products

Close Session
  Close Browser

Clear Local Storage
  Execute Javascript    localStorage.clear();

After Test
  Capture Page Screenshot

## helpers
Open Chrome
  Open Browser       about:blank    chrome    options=add_experimental_option('excludeSwitches', ['enable-logging'])

Open Chrome Headless
  Open Browser       about:blank    headlesschrome     options=add_argument('--disable-dev-shm-usage')
