Feature: Login do usuário
    Como um usuário com conta no sistema
    Desejo realizar meu acesso na aplicação
    Para conseguir utilizar os serviços do Lembra Compras

    Background: Acessar o sistema
        Given url baseUrl
        And path "auth/login"

    Scenario: Deve ser possível efetuar o login informando e-mail e senha válidos
        * def usuario = call read("hook.feature@CriarUsuario")
        Given request { email: "#(usuario.payload.email)", password: "#(usuario.payload.password)" }
        When method post
        Then status 200
        And match response contains { auth: "#boolean", session: "#object" }
        And match response.session contains { token: "#string", issued: "#number", expires: "#number" }        
        And match response contains read("responseLoginUsuario.json")

    Scenario: Não deve ser possível efetuar o login informando e-mail e senha que não esteja no cadastro da base de dados
        Given request read("requestCriarUsuario.json")
        When method post
        Then status 403
        And match response == { error: "Invalid email or password." }

    Scenario Outline: Não deve ser possível efetuar o login sem informar todos os dados <email> e <senha> 
        Given request { email: "#(email)", password: "#(senha)" }
        When method post
        Then status 400
        And match response == { error: "Bad request." }
        Examples:
            | email            | senha     |
            | grupo3@email.com |           |
            |                  | senha1234 |
            |                  |           |