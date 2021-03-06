***Settings***
Documentation       ProductsPage
...                 Representa a página cadastro de produtos com todos os seus elementos
...                 E também suas funcionalidades

***Variables***
${BUTTON_PRODUCT_ADD}       class:product-add
${TABLE_PRODUCT}            class:table
${BUTTON_MODAL_YES}         xpath://div[@class='swal2-buttonswrapper']//button[text()="Sim!"]
${BUTTON_MODAL_NO}          xpath://div[@class='swal2-buttonswrapper']//button[text()="Não!"]

***Keywords***
Go To Add Form
  Wait Until Element Is Visible    ${BUTTON_PRODUCT_ADD}
  Click Element                    ${BUTTON_PRODUCT_ADD}

Request Removal
  [Arguments]     ${title}
  Click Element     //tr[td//text()[contains(., '${title}')]]//button

Confirm Removal
  Click Element     ${BUTTON_MODAL_YES}

Cancel Removal
  Click Element     ${BUTTON_MODAL_NO}
