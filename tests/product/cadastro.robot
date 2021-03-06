***Settings***
Documentation     Cadastro de Produtos
...               Sendo um administrador de catálogo
...               Quero cadastrar novos produtos
...               Para que eu possa disponibiliza-los na loja virtual

Resource    ../../resources/actions.robot

Library     SeleniumLibrary


Suite Setup       Login Session    douglas@ninjapixel.com    q1w2E3R4@!
Suite Teardown    Close Session

Test Teardown     After Test

***Test Cases***
Novo Produto
  [Tags]    new_products
  Dado que eu tenho um novo produto     dk.json
  Quando faço o cadastro deste produto
  Então devo ver este item na lista

Produto duplicado
  [Tags]    dup
  Dado que eu tenho um novo produto     master.json
  Mas este produto já foi cadastrado
  Quando faço o cadastro deste produto
  Então devo ver a mensagem de erro    Oops - Este produto já foi cadastrado!