*** Settings ***
Documentation    Arquivo contendo nossas frases(keywords) usadas no arquivo de teste
Library          SeleniumLibrary

*** Variables ***
${URL}               https://www.amazon.com.br
${MENU_ELETRONICOS}    //a[contains(.,'Eletrônicos')]
${HEADER_ELETRONICOS}    //h1[contains(.,'Eletrônicos e Tecnologia')]
${TITULO_PAGINA_ELETRONICOS}    Eletrônicos e Tecnologia | Amazon.com.br

*** Keywords ***
Abrir o navegador
    Open Browser    browser=firefox
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
    Wait Until Page Contains    ${PRODUTO_NOME}
    