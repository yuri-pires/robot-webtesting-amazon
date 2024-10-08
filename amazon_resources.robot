*** Settings ***
Documentation    Arquivo contendo nossas frases(keywords) usadas no arquivo de teste
Library          SeleniumLibrary
#Resource         nome_do_outro_resource.robot // Assim utilizamos resources de outro arquivo de Resource, quantos forem necessários

*** Variables ***
${BROWSER}           firefox
${URL}               https://www.amazon.com.br
${MENU_ELETRONICOS}    //a[contains(.,'Eletrônicos')]
${HEADER_ELETRONICOS}    //h1[contains(.,'Eletrônicos e Tecnologia')]
${TITULO_PAGINA_ELETRONICOS}    Eletrônicos e Tecnologia | Amazon.com.br

*** Keywords ***
Abrir o navegador
    Open Browser    browser=${BROWSER}
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser
    
Acessar a home page do site Amazon.com.br
    Go To    ${URL}
    Wait Until Element Is Visible    ${MENU_ELETRONICOS}

Entrar no menu "Eletrônicos"
    Click Element    locator=${MENU_ELETRONICOS}

Verificar se aparece a frase "${FRASE}"
    Wait Until Page Contains    ${FRASE}
    Wait Until Element Is Visible    ${HEADER_ELETRONICOS}
    

# Podemos usar essas váriaveis imbutidas no teste
# Ela pertence somente a essa keyword
# Assim podemos reaproveitas código, reutilizando essa keyword
Verificar se o título da página fica "${TITULO}"
    Title Should Be    ${TITULO}

Verificar se aparece a categoria "${NOME_CATEGORIA}"
    Element Should Be Visible    css:img[alt="${NOME_CATEGORIA}"]
    
Digitar o nome de produto "${PRODUTO_NOME}" no campo de pesquisa
    Input Text    locator=twotabsearchtextbox    text=${PRODUTO_NOME}    clear=True

Clicar no botão de pesquisa
    Click Element    locator=nav-search-submit-button

O sistema deve exibir a tela com o resultado da pesquisa contendo "${PRODUTO_NOME}"
    Wait Until Element Is Visible    (//span[contains(.,'${PRODUTO_NOME}')])[3]

Adicionar o produto "${PRODUTO_NOME}" no carrinho
    Click Element    locator=//span[@class='a-size-base-plus a-color-base a-text-normal'][contains(.,'${PRODUTO_NOME}')]
    Click Element    locator=add-to-cart-button

Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso
    Wait Until Page Contains Element    locator=//h1[contains(.,'Adicionado ao carrinho')]
    
######### Gherkin Steps ############################################

## É uma boa prática com Gherkin e Robot reaproveitar keywords, para executar 
## ações e validações, sempre após uma ação, é necessário uma validação
Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br
    Verificar se o título da página fica "Amazon.com.br | Tudo pra você, de A a Z."

Quando acessar o menu "Eletrônicos"
    Entrar no menu "Eletrônicos"

Então o título da página deve ficar "${TITULO}"
    Verificar se o título da página fica "${TITULO}"

E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    Verificar se aparece a frase "Eletrônicos e Tecnologia"

E a categoria "Computadores e Informática" deve ser exibida na página
    Verificar se aparece a categoria "Computadores e Informática"

Quando pesquisar pelo produto "Xbox Series S"
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa 

Então o título da página deve ficar "Amazon.com.br : Xbox Series S"''
    Verificar se o título da página fica "Amazon.com.br : Xbox Series S"

E um produto da linha "Xbox Series S" deve ser mostrado na página
    O sistema deve exibir a tela com o resultado da pesquisa contendo "Xbox Series S"
    