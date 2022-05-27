@ignore
Feature: Hook

    @CriarUsuario
    Scenario: Criar usuário
        * def payload = read('requestCriarUsuario.json')
        Given url baseUrl
        And path "users"
        And request payload
        When method post
        Then status 201

    @Login
    Scenario: Login
        * def usuario = call read("hook.feature@CriarUsuario")
        Given url baseUrl
        And path "auth/login"
        And request { email: "#(usuario.payload.email)", password: "#(usuario.payload.password)" }
        When method post
        Then status 200
        * def responseLogin = response

    @CriarLista
    Scenario: Criar Lista
        * def payloadLista = read('requestCriarLista.json')
        Given url baseUrl
        And path "list"
        And header X-JWT-Token = token
        And request payloadLista
        When method post
        Then status 201

        Given url baseUrl
        And path "list"
        And header X-JWT-Token = token
        When method patch
        Then status 204    