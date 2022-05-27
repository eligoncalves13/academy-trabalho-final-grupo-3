Feature: Criar usuário
    Como uma pessoa qualquer
    Desejo me registrar no sistema
    Para ter acesso as funcionalidades de lista de compras

    Background: Configuração url
        * def payload = read('requestCriarUsuario.json')
        Given url baseUrl
        And path "users"
    # VERIFICAR
    Scenario Outline: Deve ser possível cadastrar usuário com dados válidos
        And request { name: "#(nome)", email: "#(email)", password: "#(senha)" }
        When method post
        Then status 201
        And match response contains read('responseCriarUsuario.json')
         Examples:
            | nome                                                                                                  | email                                                        | senha                          |
            | Raro                                                                                                  | raro@academy3.com                                            | 1234                           |
            | Raro Academy                                                                                          | r@c.com                                                      | 123456789123456789123456789123 |
            | Raro Academy Wacky League Antlez Broke the Stereo Neon Tide Bring Back Honesty Coalition Feedback Ha  | raro@c.com                                                   | 1234                           |
            | Raro Name                                                                                             | raroceagueantlezbrokestereoneontidebringbackhonesty@raro.com | 1234                           |

    Scenario: Não deve ser possível cadastrar usuário sem dados
        And request { name: "", email: "", password: "" }
        When method post
        Then status 400
        And match response contains { error: "Bad request." }

    Scenario: Não deve ser possível cadastrar usuário sem nome 
        And request { name: "", email: "#(payload.email)", password: "#(payload.password)" }
        When method post
        Then status 400
        And match response contains { error: "Bad request." }

    Scenario: Não deve ser possível cadastrar usuário sem email
        And request { name: "#(payload.name)",  email: "", password: "#(payload.password)" }
        When method post
        Then status 400
        And match response contains { error: "Bad request." }

    Scenario: Não deve ser possível cadastrar usuário sem senha
        And request { name: "#(payload.name)", email: "#(payload.email)", password: "" }
        When method post
        Then status 400
        And match response contains { error: "Bad request." }

    # VERIFICAR
    Scenario Outline: Não deve ser possível cadastrar usuário com email inválido
        And request { name: "#(payload.name)", email: "#(email)", password: "#(payload.password)" }
        When method post
        Then status 400 
        And match response contains { error: "Bad request." }
        Examples: 
            | email             |
            | raro              |
            | raro@             |
            | raro.             |
            | raro@academy      |
            | raro#@academy.com |

    Scenario: Não deve ser possível cadastrar usuário com email já existente
        * def createUser = call read('hook.feature@CriarUsuario')
    
        And request {name: "#(payload.name)", email:"#(createUser.response.email)", password: "#(payload.password)"}
        When method post
        Then status 422
        And match response contains { error: "User already exists." }

    Scenario: Não deve ser possível cadastrar usuário com nome com mais de 100 caracteres
        And request { name: "Raro Academy League Antlezz Broke the Stereo Neon Bring Back Honesty Coalition Feedback Hand of Acess", email: "#(payload.email)", password: "#(payload.password)" }
        When method post
        Then status 400
        And match response contains { error: "Bad request." }

    Scenario: Não deve ser possível cadastrar usuário com email com mais de 60 caracteres
        And request { name: "#(payload.name)", email: "raroleagueantlezbrokestereoneontidebringbackhones@academy.com", password: "#(payload.password)"}
        When method post
        Then status 400
        And match response contains { error: "Bad request." }

    #Exploratórios
    # VERIFICAR
    Scenario Outline: Não deve ser possível cadastrar usuário com nome inválido
        And request { name: "#(nome)", email: "#(payload.email)", password: "#(payload.password)" }
        When method post
        Then status 400 
        And match response contains { error: "Bad request." }
        Examples: 
            | nome  |
            | R@ro  |
            | R123  |
            | R#Ro  |
            | Ra-Ro |
            | Ra$Ro |
            | ....  |   

    # VERIFICAR
    Scenario Outline: Não deve ser possível criar usuário com nome com menos de 4 caracteres válidos
        And request { name: "#(nome)", email: "#(payload.email)", password: "#(payload.password)" }
        When method post
        Then status 400 
        And match response contains { error: "Bad request." }
        Examples: 
            | nome  |
            | Rar   |
            |  Rar  |
            |   R   |

    Scenario: Não deve ser possível cadastrar usuário com senha com mais de 30 caracteres
        And request { name: "#(payload.nome)", email: "#(payload.email)", password: "1234567891234567891234567891234" }
        When method post
        Then status 400 
        And match response contains { error: "Bad request." }