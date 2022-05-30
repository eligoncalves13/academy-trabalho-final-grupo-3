Feature: Histórico de lista de compras
    Como um usuário com conta no sistema
    Desejo consultar minhas últimas listas de compra
    Para visualizar minhas últimas compras

    Background: Acessar o sistema e efetuar login
        Given acessei a página de login do sistema Lembra Compras
        And informo os dados válidos para efetuar o login

    Scenario: Deve ser possível o usuário visualizar o histórico das últimas 10 listas, o nome e a data de criação da lista de compra
        When acesso a funcionalidade histórico
        Then visualizo o histórico das últimas 10 listas de compras
        And visualizo o nome e a data de criação da lista de compra

    Scenario: Deve ser possível visualizar o nome e itens de uma lista após interagir com a lista no Histórico
        When acesso a funcionalidade histórico
        And seleciono uma lista de compras
        Then visualizo os itens da lista de compra

    Scenario: Deve ser possível o usuário visualizar o histórico vazio
        When acesso a funcionalidade histórico vazio
        Then visualizo o histórico vazio

    Scenario: Deve ser possível acessar o histórico a partir do menu
        When acesso o menu de opções
        And seleciono a opção histórico no menu
        Then visualizo o histórico de listas

    Scenario: Deve ser possível acessar a página inicial a partir do histórico
        When acesso a funcionalidade histórico
        And seleciono a opção página inicial
        Then visualizo a página inicial do sistema