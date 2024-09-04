*** Settings ***
Documentation  Essa suíte testa o site da Amazom.com.br
Resource       amazon_resources.robot
Test Setup     Abrir o navegador
Test Teardown  Fechar o navegador

*** Test Cases ***
CT 01 - Acesso ao menu "Eletrônicos"
    [Documentation]  Esse teste verifica o menu Eletronicos da site Amazom.com.br
    ...              e verifica a categoria computadores e informatica
    [Tags]           menus    categorias    regression
    Acessar a home page do site Amazon.com.br
    Verificar se o título da página fica "Amazon.com.br | Tudo pra você, de A a Z."
    Entrar no menu "Eletrônicos"
    Verificar se aparece a frase "Eletrônicos e Tecnologia"
    Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se aparece a categoria "Computadores e Informática"
    Verificar se aparece a categoria "Tablets"

CT 02 - Pesquisa de um Produto
    [Documentation]  Este teste pesquisa por um Produto e valida que ele aparece
    ...              em tela dentro da lista de produtos achados.
    [Tags]           search    smoke    regression
    Acessar a home page do site Amazon.com.br
    Verificar se o título da página fica "Amazon.com.br | Tudo pra você, de A a Z."
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa 
    O sistema deve exibir a tela com o resultado da pesquisa contendo "Xbox Series S"
