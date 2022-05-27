Feature: Consultar histórico de lista de compras
    Como um usuário com conta no sistema
    Desejo consultar minhas últimas listas de compra
    Para visualizar minhas últimas compras

    Background: Acesar o sistema e efetuar login
        Given acessei o sistema
        And informei e-mail e senha para fazer o login
            | email | grupo3@email.com |
            | senha | senha1234        |
        When acessei a tela de histórico

    Scenario: Deve ser possível o usuário logado visualizar o histórico de suas próprias listas de compras
        Then visualizo o histórico das listas de compras do usuário logado

    Scenario: Deve ser possível o usuário visualizar apenas o histórico das últimas 10 listas mais recentes
        Then visualizo o histórico das últimas 10 listas de compras mais recentes

    Scenario: Deve ser possível o usuário visualizar o nome e data de criação da lista
        Then visualizo o nome e a data de criação da lista de compra

    Scenario: Deve ser possível consultar o nome e itens de uma lista após interagir com a lista no Histórico
        When selecionei a lista de compra
        Then visualizo os itens da lista de compra selecionada