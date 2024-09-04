*** Settings ***
Documentation  Essa suíte testa o site da Amazom.com.br com Gherkin
Resource       amazon_resources.robot
Test Setup     Abrir o navegador
Test Teardown  Fechar o navegador

*** Test Cases ***
CT 01 - Acesso ao menu "Eletrônicos"
    [Documentation]  Esse teste verifica o menu Eletronicos da site Amazom.com.br
    ...              e verifica a categoria computadores e informatica
    [Tags]           menus    categorias    regression
    Dado que estou na home page da Amazon.com.br
    Quando acessar o menu "Eletrônicos"
    Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    E a categoria "Computadores e Informática" deve ser exibida na página

# CT 02 - Pesquisa de um Produto
#     [Documentation]  Este teste pesquisa por um Produto e valida que ele aparece
#     ...              em tela dentro da lista de produtos achados.
#     [Tags]           search    smoke    regression
#     Dado que estou na home page da Amazon.com.br
#     Quando pesquisar pelo produto "Xbox Series S"
#     Então o título da página deve ficar "Amazon.com.br : Xbox Series S
#     E um produto da linha "Xbox Series S" deve ser mostrado na página

