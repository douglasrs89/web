***Settings***
Documentation       ProductsPage
...                 Representa a página cadastro de produtos com todos os seus elementos
...                 E também suas funcionalidades

***Variables***
${BUTTON_PRODUCT_ADD}       class:product-add
${TABLE_PRODUCT}            class:table


***Keywords***
Go To Add Form
  Wait Until Element Is Visible    ${BUTTON_PRODUCT_ADD}
  Click Element                    ${BUTTON_PRODUCT_ADD}