***Settings***
Documentation     Aqui teremos todas as palavras de ação para implementar os testes.

Library     SeleniumLibrary
Library     libs/database.py

Resource    helpers.robot
Resource    pages/BasePage.robot
Resource    pages/Components.robot
Resource    pages/LoginPage.robot
Resource    pages/ProductsPage.robot
Resource    pages/ProductsAddPage.robot
Resource    pages/SideBar.robot

***Keywords***

## login steps
Dado que acesso a página login
  Go To   http://pixel-web:3000/login

Quando eu submeto minhas credenciais "${email}" e "${pass}"
  LoginPage.Login With    ${email}    ${pass}

Então devo ser autenticado
  Wait Until Element Is Visible    ${LOGGED_USER}
  Wait Until Element Contains      ${LOGGED_USER}    Douglas Rosa

Então devo ver a mensagem de alerta "${expect_alert}" 
  Wait Until Element Is Visible     ${ALERT}
  Element Text Should Be            ${ALERT}    ${expect_alert}

## product steps
Dado que eu tenho um novo produto
  [Arguments]    ${json_file}
  ${product_json}=           Get Data From Json File    ${json_file}
  Remove Product By Title    ${product_json['title']}
  Set Test Variable          ${product_json}
  Set Product Variables

Quando faço o cadastro deste produto
  Go To Add Form
  Create New Product    ${product_json}

Então devo ver este item na lista
  Table Should Contain             ${TABLE_PRODUCT}    ${product_json['title']}

Mas este produto já foi cadastrado
  Go To Add Form
  Create New Product    ${product_json}

Então devo ver a mensagem de alerta
  [Arguments]    ${expect_alert}
  Wait Until Element Contains    ${ALERT}    ${expect_alert}

Então devo ver a mensagem de erro
  [Arguments]    ${expect_alert}
  Wait Until Element Contains    ${ALERT_DANGER}    ${expect_alert}

Então devo ver a mensagem informativa
  [Arguments]    ${expect_alert}
  Wait Until Element Contains    ${ALERT_INFO}    ${expect_alert}

# exclusão
Dado "${json_file}" é um produto indesejado
  #implementando com o conceito shared steps
  Dado que eu tenho um novo produto  ${json_file}
  Quando faço o cadastro deste produto


Quando eu solicito a Exclusão
  Request Removal    ${product_json['title']}

E confirmo a solicitação
  Confirm Removal

E cancelo a solicitação
  Cancel Removal

Então não devo ver este item no catálogo
  Wait Until Element Does Not Contain    ${TABLE_PRODUCT}    ${product_json['title']}
