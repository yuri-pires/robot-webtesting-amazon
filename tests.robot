*** Test Cases ***
CT 01 - Acesso ao menu "Eletrônicos"
    [Documentation]  Esse teste verifica o menu Eletronicos da site Amazom.com.br
    ...              e verifica a categoria computadores e informatica
    [Tags]           menus categorias
    Acessar a home page do site Amazon.com.br
    Entrar no menu "Eletrônicos"
    Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se aparece a frase "Eletrônicos e Tecnologia"
    Verificar se aparece a categoria "Computadores e Informática"