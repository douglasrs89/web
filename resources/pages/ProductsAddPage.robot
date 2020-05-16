***Settings***
Documentation       ProductsAddPage
...                 Representa a página de cadastro de produtos com todos os seus elementos
...                 E também suas funcionalidades

***Variables***
${INPUT_PRODUCT_TITLE}      css:input[placeholder$="produto?"]
${SELECT_GATEGORIA}         css:input[placeholder^=Gat]
# ${SELECT_GATEGORIA_TEXT}    xpath://li//span[text()='${product_json['cat']}']
${INPUT_PRODUCT_PRICE}      css:input[name=price]
${BUTTON_CREATE_PRODUCT}    id:create-product

***Keywords***
Set Product Variables
  Set Test Variable    ${SELECT_GATEGORIA_TEXT}    xpath://li//span[text()='${product_json['cat']}']