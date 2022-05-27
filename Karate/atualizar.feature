Feature: Atualizar usuário
    Como um usuário com conta no sistema
    Desejo atualizar minhas informações básicas
    Para manter meus dados atualizados no sistema.

    Background: Cria um usuário e realiza o login
        Given url "https://lista-compras-api.herokuapp.com/api/v1"
        * def email = java.util.UUID.randomUUID() + "kamilly@email.com"
        * def payload = { name: "Kamilly", email: "#(email)" , password: "12345678" }
        Given path "users"
        Given request payload
        When method post 
        Then status 201

        Given path "/auth/login"
        Given request { email: "#(payload.email)", password: "#(payload.password)" }
        When method post
        Then status 200
        * def token = response.session.token
        

    @ignore
    Scenario: Deve ser possível editar o nome e o Email do usuário criado
        * def novoEmail = java.util.UUID.randomUUID() + "luzia@email.com"
        * def payloadAtualizar = { name: "Luzia", email: "#(novoEmail)" }
        Given path "users"
        And header X-JWT-Token = token
        Given request payloadAtualizar
        When method put
        Then status 200
        And match response contains payloadAtualizar

    @ignore
    Scenario: Não deve ser possivel editar um usuário com mais de 100 caracteres no campo nome
        Given path "users"
        And header X-JWT-Token = token
        Given request { name: "Luziaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", email: "#(novoEmail)" }
        When method put
        Then status 400
        And match response contains { error: "Bad request." }

    @ignore
    Scenario: Não deve ser possível salvar usuário sem nome
        Given path "users"
        And header X-JWT-Token = token
        Given request { name: "", email: "#(novoEmail)" }
        When method put
        Then status 400
        And match response contains { error: "Bad request." }

    @ignore
    Scenario Outline: Não deve ser possível salvar com E-mail inválido
         Given path "users"
        And header X-JWT-Token = token
        Given request { name: "Kamilly", email: "#(emailUsuario)" } 
        When method put
        Then status 400
        And match response contains { error: "Bad request." }
        Examples:
                | emailUsuario          | 
                | joventinagmail.com    |
                | joventina@gmail       |
                | joventina @gmail.com  |
                | joventina@gmail.com'  |
                | joventina@gmail.com"  |
                | joventina&@gmail.com  |
                | joventina#@gmail.com  |
                | joventina=@gmail.com  |
                | joventina-@gmail.com  |
                | joventina+@gmail.com  |
                | joventina,@gmail.com  |
                | joventina..@gmail.com |
     
     #ainda não deu certo
    Scenario: Não deve ser possível atualzair o email com o mesmo e-mail de outro usuário
        * def payloadAtualizar = { name: "Kamilly", email: "#(emailIgual)" }
        Given path "users"
        And header X-JWT-Token = token
        Given request payloadAtualizar
        When method put
        Then status 400
        And match response contains payloadAtualizar

    @ignore
     Scenario: Não deve ser possivel atualizar E-mail com mais de 60 caracteres
        * def email = java.util.UUID.randomUUID() + "asdsdfsdkamilly@email.com"
        Given path "users"
        And header X-JWT-Token = token
        Given request { name: "Joaquina", email: "#(email)" } 
        When method put
        Then status 400
        And match response contains { error: "Bad request." }

    @ignore
    Scenario:  Não deve ser possivel salvar usuário sem email
        Given path "users"
        And header X-JWT-Token = token
        Given request { name: "Joaquina", email: "" }
        When method put
        Then status 400
        And match response contains { error: "Bad request." }

    @ignore
    Scenario Outline: Não deve ser possível salvar com nome inválido
        * def email = java.util.UUID.randomUUID() + "@email.com"
        Given path "users"
        And header X-JWT-Token = token
        Given request { name: "#(nameUsuario)", email: "#(email)" } 
        When method put
        Then status 400
        And match response contains { error: "Bad request." }
        Examples:
            | nameUsuario |
            | K@milly     |
            | Kam1lly     |
            | Kami-lly    |
            | Kamilly!    |
            | Kamilly?    |
            | Kamilly .   |
            | ......      |

    

