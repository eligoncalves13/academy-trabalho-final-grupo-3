Feature: Consultar histórico de lista de compras
    Como um usuário com conta no sistema
    Desejo consultar minhas últimas listas de compra
    Para visualizar minhas últimas comprass

    Background: Acessar o sistema
        Given url baseUrl
        * def login = call read("hook.feature@Login")

    Scenario: Deve ser possível o usuário logado visualizar o histórico de suas próprias listas de compras
        * table lista
            | descricao | token                             |
            | 'Lista 1' | login.responseLogin.session.token |
        * call read("hook.feature@CriarLista") lista
        Given path "list/history"
        And header X-JWT-Token = login.responseLogin.session.token
        When method get
        Then status 200
        And match response == "#array"
        And match each response contains { id: "#uuid", userId: "#uuid", description: "#string", active: "#boolean", createdAt: "#string", updatedAt: "#string" }

    Scenario: Deve ser possível visualizar o histórico das últimas 10 listas, o nome e a data de criação da lista de compra
        * table lista
            | descricao  | token                             |
            | 'Lista 1'  | login.responseLogin.session.token |
            | 'Lista 2'  | login.responseLogin.session.token |
            | 'Lista 3'  | login.responseLogin.session.token |
            | 'Lista 4'  | login.responseLogin.session.token |
            | 'Lista 5'  | login.responseLogin.session.token |
            | 'Lista 6'  | login.responseLogin.session.token |
            | 'Lista 7'  | login.responseLogin.session.token |
            | 'Lista 8'  | login.responseLogin.session.token |
            | 'Lista 9'  | login.responseLogin.session.token |
            | 'Lista 10' | login.responseLogin.session.token |
            | 'Lista 11' | login.responseLogin.session.token |
            | 'Lista 12' | login.responseLogin.session.token |
            | 'Lista 13' | login.responseLogin.session.token |
            | 'Lista 14' | login.responseLogin.session.token |
            | 'Lista 15' | login.responseLogin.session.token |
        * call read("hook.feature@CriarLista") lista
        Given path "list/history"
        And header X-JWT-Token = login.responseLogin.session.token
        When method get
        Then status 200
        And match response == "#array"
        And match each response contains { id: "#uuid", userId: "#uuid", description: "#string", active: "#boolean", createdAt: "#string", updatedAt: "#string" }

    Scenario: Deve ser possível consultar uma lista informando o id
        * table lista
            | descricao | token                             |
            | 'Lista 1' | login.responseLogin.session.token |
        * call read("hook.feature@CriarLista") lista
        Given path "list/history"
        And header X-JWT-Token = login.responseLogin.session.token
        When method get
        Then status 200
        * def listaId = response[0].id

        Given path "list/history"
        And path listaId
        And header X-JWT-Token = login.responseLogin.session.token
        When method get
        Then status 200
        And match response contains { description: "#string", items: "#array" }
        And match each response.items contains { id: "#uuid", listId: "#uuid", name: "#string", amount: "#number", createdAt: "#string", updatedAt: "#string" }
        And assert response.items[0].listId == listaId

    Scenario: Não deve ser possível consultar o histórico de lista de compra passando token inválido
        Given path "list/history"
        And header X-JWT-Token = "tokeninvalido"
        When method get
        Then status 401
        And match response contains { status: "#number", message: "#string" }
        And assert response.status == 401
        And assert response.message == "Invalid token."

    Scenario: Não deve ser possível consultar o histórico de lista de compra sem estar logado
        Given path "list/history"
        When method get
        Then status 401
        And match response contains { status: "#number", message: "#string" }
        And assert response.status == 401
        And assert response.message == "Required X-JWT-Token header not found."

    Scenario: Não deve ser possível consultar uma lista informando o id inexistente
        * def idLista = java.util.UUID.randomUUID().toString()
        Given path "list/history"
        And path idLista
        And header X-JWT-Token = login.responseLogin.session.token
        When method get
        Then status 404
        And match response contains { error: "#string" }
        And assert response.error == "List not found."

    Scenario: Não deve ser possível consultar uma lista informando o id inválido
        Given path "list/history/idInvalido"
        And header X-JWT-Token = login.responseLogin.session.token
        When method get
        Then status 500
        And match response contains { error: "#string" }
        And assert response.error == "An error ocurred."

    Scenario: Não deve ser possível o usuário logado visualizar o histórico de listas de compras de outros usuários
        * table lista
            | descricao | token                             |
            | 'Lista Usuario 1' | login.responseLogin.session.token |
        * call read("hook.feature@CriarLista") lista
        Given path "list/history"
        And header X-JWT-Token = login.responseLogin.session.token
        When method get
        Then status 200
        * def listaId = response[0].id

        * def login = call read("hook.feature@Login")
        Given path "list/history"
        And path listaId
        And header X-JWT-Token = login.responseLogin.session.token
        When method get
        Then status 404
        And match response contains { error: "#string" }
        And assert response.error == "List not found."