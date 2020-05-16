***Settings***
Documentation     Cadastro de Produtos
...               Sendo um administrador de catálogo
...               Quero cadastrar novos produtos
...               Para que eu possa disponibiliza-los na loja virtual

Resource    ../resources/actions.robot

Library     SeleniumLibrary


Suite Setup       Login Session    douglas@ninjapixel.com    q1w2E3R4@!
Suite Teardown    Close Session

Test Teardown     After Test

***Test Cases***
Novo Produto
  Dado que eu tenho um novo produto     dk.json
  Quando eu cadastro este produto
  Então devo ver este item na lista
