***Settings***
Documentation     Tentativa de Cadastro de Produtos
...               Estes cenários enriquessem a história da suite cadastro.robot

Resource    ../../resources/actions.robot

Library     SeleniumLibrary


Suite Setup       Login Session    douglas@ninjapixel.com    q1w2E3R4@!
Suite Teardown    Close Session

Test Template     Tentar cadastrar produtos

***Keywords***
Tentar cadastrar produtos
  [Arguments]    ${json_file}    ${expected_message}
  Dado que eu tenho um novo produto    ${json_file}
  Quando faço o cadastro deste produto
  Então devo ver a mensagem de alerta    ${expected_message}
  [Teardown]    Product Template Teardown

Product Template Teardown
  After Test
  Products Page

***Test Cases***
Nome do produto obrigatório     contra.json       Oops - Informe o nome do produto!

Categoria não selecionada       streetf2.json     Oops - Selecione uma categoria!

Preço do produto obrigatório    shinobi.json      Oops - Informe o preço também!