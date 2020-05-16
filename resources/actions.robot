***Settings***
Documentation     Aqui teremos todas as palavras de ação para implementar os testes.

Library     SeleniumLibrary
Library     libs/database.py

Resource    pages/BasePage.robot
Resource    pages/LoginPage.robot
Resource    pages/ProductsPage.robot
Resource    pages/ProductsAddPage.robot
Resource    pages/SideBar.robot

***Keywords***

## login steps
Dado que acesso a página login
  Go To   http://localhost:3000/login

Quando eu submeto minhas credenciais "${email}" e "${pass}"
  LoginPage.Login With    ${email}    ${pass}

Então devo ser autenticado
  Wait Until Element Is Visible    ${LOGGED_USER}
  Wait Until Element Contains      ${LOGGED_USER}    Douglas Rosa

Então devo ver a mensagem de alerta "${expect_alert}" 
  Wait Until Element Is Visible     ${DIV_ALERT}
  Element Text Should Be            ${DIV_ALERT}    ${expect_alert}

## product steps
Dado que eu tenho um novo produto
  [Arguments]    ${json_file}
  ${product_json}=           Get Data From Json File    ${json_file}
  Remove Product By Title    ${product_json['title']}
  Set Test Variable          ${product_json}
  Set Product Variables

Quando eu cadastro este produto
  Wait Until Element Is Visible    ${BUTTON_PRODUCT_ADD}
  Click Element                    ${BUTTON_PRODUCT_ADD}
  Input Text                       ${INPUT_PRODUCT_TITLE}    ${product_json['title']}
  Click Element                    ${SELECT_GATEGORIA}
  Wait Until Element Is Visible    ${SELECT_GATEGORIA_TEXT}
  Click Element                    ${SELECT_GATEGORIA_TEXT}
  Input Text                       ${INPUT_PRODUCT_PRICE}    ${product_json['price']}
  Click Element                    ${BUTTON_CREATE_PRODUCT}

Então devo ver este item na lista
  Table Should Contain             ${TABLE_PRODUCT}    ${product_json['title']}