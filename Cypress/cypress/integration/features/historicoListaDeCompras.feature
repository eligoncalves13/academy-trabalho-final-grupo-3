Feature: Consultar histórico de lista de compras
    Como um usuário com conta no sistema
    Desejo consultar minhas últimas listas de compra
    Para visualizar minhas últimas compras

    Background: Acessar o sistema e efetuar login
        Given acessei o sistema Lembra Compras
        And informo os dados válidos para efetuar o login
        When seleciono a funcionalidade histórico

    Scenario: Deve ser possível o usuário visualizar o histórico das últimas 10 listas de compra
        Then visualizo o histórico das últimas 10 listas de compras
        And visualizo o nome e a data de criação da lista de compra

    # Scenario: Deve ser possível o usuário visualizar o nome e data de criação da lista
    #     Then visualizo o nome e a data de criação da lista de compra

    # Scenario: Deve ser possível visualizar o nome e itens de uma lista após interagir com a lista no Histórico
    #     When seleciono a lista de compras
    #     Then visualizo os itens da lista de compra

    #Scenario: Não deve ser possível visualizar as listas de outro usuario 