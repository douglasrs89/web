*** Settings ***
Documentation     Login
...               Sendo um administrador de catálogo
...               Quero me autenticar no sistema
...               Para que eu possa gerenciar os produtos da loja virtual

Resource          ../../resources/actions.robot

Suite Setup       Open Session
Suite Teardown    Close Session
Test Teardown     After Test

***Test Cases***
Usuário autenticado
  [tags]    success_login
  Dado que acesso a página login
  Quando eu submeto minhas credenciais "douglas@ninjapixel.com" e "q1w2E3R4@!"
  Então devo ser autenticado
  [Teardown]    Clear Local Storage

Senha invalida
  [Template]    Tentativa de login
  douglas@ninjapixel.com    qa123    Usuário e/ou senha inválidos

Email não cadastrado
  [Template]    Tentativa de login
  404@ninjapixel.com    q1w2E3R4    Usuário e/ou senha inválidos

Email incorreto
  [Template]    Tentativa de login
  douglas&ninjapixel.com    q1w2E3R4    Usuário e/ou senha inválidos

Email não informado
  [Template]    Tentativa de login
  ${EMPTY}    q1w2E3R4    Opps. Informe o seu email!

Senha não informada
  [Template]    Tentativa de login
  douglas@ninjapixel.com    ${EMPTY}    Opps. Informe a sua senha!


***Keywords***
Tentativa de login
  [Arguments]    ${input_email}    ${input_pass}    ${output_message}

  Dado que acesso a página login
  Quando eu submeto minhas credenciais "${input_email}" e "${input_pass}"
  Então devo ver a mensagem de alerta "${output_message}"