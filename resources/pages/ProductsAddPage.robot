***Settings***
Documentation       ProductsAddPage
...                 Representa a página de cadastro de produtos com todos os seus elementos
...                 E também suas funcionalidades

***Variables***
${INPUT_PRODUCT_TITLE}      css:input[placeholder$="produto?"]
${SELECT_GATEGORIA}         css:input[placeholder^=Gat]
${INPUT_PRODUCT_PRICE}      css:input[name=price]
${BUTTON_CREATE_PRODUCT}    id:create-product
${ALERT_DANGER}             class:alert-danger
${INPUT_PRODUCERS}          class:producers
${TEXTAREA_DESCRIPTION}     css:textarea[name=description]
${INPUT_IMAGE}              id:upcover
${ALERT_PRODCUT}            css:.card-body .alert-info

***Keywords***
Set Product Variables
  Run Keyword If    "${product_json['cat']}" != "${EMPTY}"
  ...               Set Test Variable    ${SELECT_GATEGORIA_TEXT}    xpath://li//span[text()='${product_json['cat']}']

Create New Product
  [Arguments]    ${product_json}
  Input Text         ${INPUT_PRODUCT_TITLE}    ${product_json['title']}
  Run Keyword If     "${product_json['cat']}" != "${EMPTY}"
  ...                Select Category
  Input Text         ${INPUT_PRODUCT_PRICE}    ${product_json['price']}
  Input Producers    ${product_json['producers']}
  Input Text         ${TEXTAREA_DESCRIPTION}    ${product_json['desc']}
  Upload Photo       ${product_json['file_name']}
  Click Element      ${BUTTON_CREATE_PRODUCT}

Input Producers
  [Arguments]    ${producers}
  FOR    ${p}    IN    @{product_json['producers']}
         Input Text    ${INPUT_PRODUCERS}    ${p}
         Press Keys    ${INPUT_PRODUCERS}    TAB
  END

Select Category
  Click Element      ${SELECT_GATEGORIA}
  Wait Until Element Is Visible    ${SELECT_GATEGORIA_TEXT}
  Click Element                    ${SELECT_GATEGORIA_TEXT}

Upload Photo
  [Arguments]     ${file_name}
  ${image_file}=    Set Variable      ${EXECDIR}/web/resources/fixtures/images/${file_name}
  Choose File       ${INPUT_IMAGE}    ${image_file}
