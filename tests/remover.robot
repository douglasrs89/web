***Settings***
Documentation     Exclusão de Produtos
...               Sendo um administrador de catálogo que possui produtos indesejados
...               Quero deletar novos produtos
...               Para que eu possa manter meu catálogo organizado

Resource    ../resources/actions.robot

Suite Setup       Login Session    douglas@ninjapixel.com    q1w2E3R4@!
Suite Teardown    Close Session

Test Teardown     After Test

***Test Cases***
Apagar produto
  [Tags]     remove
  Dado "mario.json" é um produto indesejado
  Quando eu solicito a Exclusão
  E confirmo a solicitação
  Então não devo ver este item no catálogo

Desistir da remoção
  [Tags]     remove
  Dado "zelda.json" é um produto indesejado
  Quando eu solicito a Exclusão
  E cancelo a solicitação
  Então devo ver este item na lista