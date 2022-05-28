Feature: Login do usuário
    Como um usuário com conta no sistema
    Desejo realizar meu acesso na aplicação
    Para conseguir utilizar os serviços do Lembra Compras

    Background: Acessar o sistema
        Given acessei o sistema Lembra Compras

    Scenario: Deve ser possível efetuar o login informando os dados válidos
        When informo os dados válidos para efetuar o login
        Then visualizo as demais funcionalidades do sistema

    Scenario: Não deve ser possível efetuar o login informando os dados que não estejam cadastrados
        When informo os dados não cadastrados no sistema para efetuar o login
        Then visualizo a mensagem informando que e-mail ou senha estão incorretos "E-mail ou senha incorretos."

    Scenario Outline: Não deve ser possível efetuar o login sem informar todos os dados
        When informo os dados do usuário para efetuar o login
            | emailLogin | <email> |
            | senhaLogin | <senha> |
        Then visualizo a mensagem solicitando o preenchimento dos dados "<mensagem>"
        Examples:
            | email            | senha     | mensagem                             |
            | grupo3@email.com |           | Informe sua senha                    |
            |                  | senha1234 | Informe seu e-mail                   |
            |                  |           | Informe seu e-mail;Informe sua senha |

    Scenario Outline: Não deve ser possível efetuar o login informando os dados inválido
        When informo os dados inválido para efetuar o login
            | emailLogin | <email> |
            | senhaLogin | <senha> |
        Then visualizo a mensagem informando que os dados são inválidos "<mensagem>"
        Examples:
            | email                                                                                                         | senha                               | mensagem                          |           
            | !@#$% @email.com                                                                                              | senha1234                           | Formato de e-mail inválido.       |
            | abc                                                                                                           | senha1234                           | Informe um e-mail válido.         |
            | abcdefghijklmnopqrstuvwxyz0123456789abcdefghijklmnopqrstuvwxyz0123456789_ABCDEFGHIJKLMNOPQRSTUVWXYZ@email.com | senha1234                           | Informe no máximo 100 caracteres. |
            | grupo3@email.com                                                                                              | ABCDEFGHIJKLMNOPQRSTUVWXYZ_12345**  | Informe no máximo 30 caracteres.  |
  
    Scenario: Deve ser possível acessar a página para cadastrar um novo usuário
        When não informo os dados do usuário
        And acesso a opção registrar um novo usuário
        Then visualizo o formulário para registar um novo usuário