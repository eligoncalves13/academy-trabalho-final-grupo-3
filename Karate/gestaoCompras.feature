Feature: Gestão de lista de compras
    Como um usuário com conta no sistema
    Desejo gerenciar uma lista de compras
    Para registrar os produtos que desejo comprar

    Background: Base url
        * def login = call read("hook.feature@Login")
        Given url baseUrl
        And path "list"
        And header X-JWT-Token = login.responseLogin.session.token

    Scenario Outline: Criar lista com sucesso 
        And request { description: "#(descricao)", items: [{ name: "#(nome_item)", amount: "#(quantidade)" }] }
        When method post
        Then status 201
        Examples:
            | descricao | nome_item | quantidade |
            | Feirinha  | Pastel    | 1          |
            | Padaria   | Arroz 1k  | 1000       |

    Scenario: Criar uma lista sem descricao, dado que ao menos um item tenha sido adicionado
        And request { description: "", items: [{ name: "Pastel", amount: 1 }] }
        When method post
        Then status 201

    Scenario: A quantidade mínima de um item na lista deve ser de 1 unidade
        And request { description: "Feirinha", items: [{ name: "Pastel", amount: 0 }] }
        When method post
        Then status 400
        And match response contains { error: "Bad request." }

    Scenario: A quantidade máxima de um item na lista deve ser de 1000 unidades
        And request { description: "Feirinha", items: [{ name: "Pastel", amount: 1001 }] }
        When method post
        Then status 422
        And match response contains { error: "Max item amount is 1000." }

    Scenario Outline: Não deve ser possível adicionar item com nome inválido
        And request { description: "#(descricao)", items: [{ name: "#(nome_item)", amount: 2 }] }
        When method post
        Then status 400
        And match response contains { error: "Bad request." }
        Examples:
            | descricao | nome_item                              |   
            | Feirinha  | Ja!ca#                                 | 
            | Mercado   | PeraUvaMaçaSaladaPeraUvaMaçaSaladaPera | 
            | Natal     | T                                      |  

    Scenario Outline: Deve ser possível atualizar quantidade do item quando está criando uma lista
        And request { description: "Feirinha", items: [{ name: "Pastel", amount: "#(quantidade)" }, { name: "Pastel", amount: "#(quantidade_novo)" }] }
        When method post
        Then status 201

        And header X-JWT-Token = login.responseLogin.session.token
        And path "list"
        When method get 
        Then status 200
        And match response contains read('responseLista.json')

        Examples:
            | quantidade! | quantidade_novo! | 
            | 1           | 2                |
            | 50          | 1                |
            | 60          | 20               |

    Scenario Outline: Deve ser possível atualizar quantidade do item quando a lista já está criada
        And request { description: "Feirinha", items: [{ name: "Pastel", amount: "#(quantidade)" }] }
        When method post
        Then status 201

        And path "list/item"
        And header X-JWT-Token = login.responseLogin.session.token
        And request { name: "Pastel", amount: "#(quantidade_novo)" }
        When method post
        Then status 201

        And header X-JWT-Token = login.responseLogin.session.token
        And path "list"
        When method get 
        Then status 200
        And match response contains read('responseLista.json')
        
        Examples:
            | quantidade! | quantidade_novo! | 
            | 1           | 2                |
            | 50          | 1                |
            | 60          | 20               |
  
    Scenario: Não deve ser possível atualizar quantidade do item maior que 1000 unidades quando está criando a lista
        And request { description: "Feirinha", items: [{ name: "Pastel", amount: 999 }, { name: "Pastel", amount: 2 }] }
        When method post
        Then status 422
        And match response contains { error: "Max item amount is 1000." }

    Scenario: Não deve ser possível atualizar quantidade do item maior que 1000 unidades quando a lista já está criada
        And request { description: "Feirinha", items: [{ name: "Pastel", amount: 999 }] }
        When method post

        And path "list/item"
        And header X-JWT-Token = login.responseLogin.session.token
        And request { name: "Pastel", amount: 2 }
        When method post
        Then status 422
        And match response contains { error: "Max item amount is 1000." }

    Scenario: Deve ser possível finalizar a lista de compras 
        And request { description: "Feirinha", items: [{ name: "Pastel", amount: 1 }] }
        When method post
        
        And path "list"
        And header X-JWT-Token = login.responseLogin.session.token
        And method patch   
        Then status 204