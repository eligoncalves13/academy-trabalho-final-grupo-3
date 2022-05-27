Feature: Login do usuário
    Como um usuário com conta no sistema
    Desejo realizar meu acesso na aplicação
    Para conseguir utilizar os serviços do Lembra Compras

    Background: Acesar o sistema
        Given acessei o sistema Lembra Compras

    Scenario: Deve ser possível efetuar o login informando e-mail e senha válidos
        When informo o e-mail e senha válidos para efetuar o login
            | email | grupo3@email.com |
            | senha | senha1234        |
        Then acesso as demais funcionalidades do sistema

    Scenario: Não deve ser possível efetuar o login informando e-mail e senha que não esteja no cadastro da base de dados
        When informo o e-mail e senha não cadastrados no sistema
            | email | naocadastrado@email.com |
            | senha | 123456                  |
        Then visualizo a mensagem informando que e-mail ou senha estão incorretos: "E-mail ou senha incorretos."

    Scenario: Não deve ser possível efetuar o login sem informar o e-mail e a senha
        When não informo o e-mail e senha para efetuar o login
        Then visualizo a mensagem solicitando o e-mail: "Informe seu e-mail"
        And visualizo a mensagem solicitando a senha: "Informe sua senha"

    Scenario: Não deve ser possível efetuar o login informando somente o e-mail do usuário
        When informo somente o e-mail do usuário para efetuar o login
            | email | grupo3@email.com |
        Then visualizo a mensagem solicitando a senha: "Informe sua senha"

    Scenario: Não deve ser possível efetuar o login informando somente a senha do usuário
        When informo somente a senha do usuário para efetuar o login
            | senha | senha1234 |
        Then visualizo a mensagem solicitando o e-mail: "Informe seu e-mail"

    Scenario Outline: Não deve ser possível efetuar o login informando o e-mail inválido
        When informo a senha válida e o e-mail inválido para efetuar o login
            | email | <email> |
            | senha | <senha> |
        Then visualizo uma mensagem informando que o formato do e-mail é inválido "<mensagem>"
        Examples:
            | email             | senha     | mensagem                    |
            | grupo3email.com   | senha1234 | Formato de e-mail inválido. |
            | grupo3@           | senha1234 | Formato de e-mail inválido. |
            | grupo3@email      | senha1234 | Formato de e-mail inválido. |
            | grupo3@email.     | senha1234 | Formato de e-mail inválido. |
            | !@#$% @email.com  | senha1234 | Formato de e-mail inválido. |
            | grupo3 @email.com | senha1234 | Formato de e-mail inválido. |
            | @email.com        | senha1234 | Formato de e-mail inválido. |
            | grupo3@email. com | senha1234 | Formato de e-mail inválido. |
            | grupo3.           | senha1234 | Formato de e-mail inválido. |

    Scenario: Não deve ser possível efetuar o login informando e-mail com menos de 4 caracteres
        When informo a senha válida e o e-mail com menos de 4 caracteres para efetuar o login
            | email | abc       |
            | senha | senha1234 |
        Then visualizo a mensagem solicitando um e-mail válido: "Informe um e-mail válido."

    Scenario: Não deve ser possível efetuar o login informando e-mail com mais de 100 caracteres
        When informo a senha válida e o e-mail com mais de 100 caracteres para efetuar o login
            | email | abcdefghijklmnopqrstuvwxyz0123456789abcdefghijklmnopqrstuvwxyz0123456789_ABCDEFGHIJKLMNOPQRSTUVWXYZ@email.com |
            | senha | senha1234                                                                                                     |
        Then visualizo a mensagem solicitando no máximo 100 caracteres para o e-mail: "Informe no máximo 100 caracteres."

    Scenario: Não deve ser possível efetuar o login informando a senha com mais de 30 caracteres
        When informo o e-mail válido e a senha com mais de 30 caracteres para efetuar o login
            | email | grupo3@email.com                   |
            | senha | ABCDEFGHIJKLMNOPQRSTUVWXYZ_12345** |
        Then visualizo a mensagem solicitando no máximo 30 caracteres para a senha: "Informe no máximo 30 caracteres."

    Scenario: Deve ser possível ir para a tela para cadastrar um novo usuário
        When não informo o e-mail e a senha
        Then seleciono para cadastrar um novo usuário
        And visualizo o formulário para cadastrar novo usuário