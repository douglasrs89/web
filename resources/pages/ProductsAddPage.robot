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
${ALERT_DANGER}             class:alert-danger

***Keywords***
Set Product Variables
  Set Test Variable    ${SELECT_GATEGORIA_TEXT}    xpath://li//span[text()='${product_json['cat']}']

Select Category
  # [Arguments]    ${cat}
  Wait Until Element Is Visible    ${SELECT_GATEGORIA_TEXT}
  Click Element                    ${SELECT_GATEGORIA_TEXT}
  Input Text                       ${INPUT_PRODUCT_PRICE}    ${product_json['price']}

Create New Product
  [Arguments]    ${product_json}
  Input Text                       ${INPUT_PRODUCT_TITLE}    ${product_json['title']}
  Click Element                    ${SELECT_GATEGORIA}
  Select Category  
  Click Element                    ${BUTTON_CREATE_PRODUCT}