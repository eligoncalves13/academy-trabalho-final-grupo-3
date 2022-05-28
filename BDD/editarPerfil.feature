Feature: Editar perfil
    Como um usuário com conta no sistema
    Desejo atualizar minhas informações básicas
    Para manter meus dados atualizados no sistema.

    Background: Acessar o sistema
        Given acessei o sistema Lembra Compras
        When informo os dados válidos para efetuar o login
        Then visualizo o perfil no menu de opções
        
    Scenario: Deve ser possível atualizar nome do usuário com sucesso
        When informo o nome válido para editar o perfil
        Then visualizo a mensagem de sucesso "Informações atualizadas com sucesso!"

    Scenario: Não deve ser possível editar usuário com nome com mais de 100 caracteres
        When informo o nome com mais de 100 caracteres
        Then visualizo a mensagem de erro "Informe no máximo 100 letras no seu nome"

    Scenario: Não deve ser possível salvar usuário sem nome
        When não informo nome do usuário
        Then visualizo a mensagem de erro "Informe seu nome"

    Scenario: Não deve ser possível salvar nome com números ou caracteres especiais
        When informo o nome do usuário
            | nome | @na Luiza |
            | nome | Ana Lu1za |
            | nome | Ana Lu-iza |
        Then visualizo a mensagem de erro "Formato do nome é inválido."

    Scenario: Deve ser possível atualizar E-mail do usuário com sucesso
        When informo o email válido para editar o perfil
        Then visualizo a mensagem de sucesso "Informações atualizadas com sucesso!"

    Scenario: Não deve ser possível cadastrar email utilizado por outro usuário
        And clico no campo E-mail
        Then Atualizo o email do usuário com um e-mail já cadastrado
            | Email | joventina@gmail.com |
        And clico em confirmar alterações
        And clico em confirmar novamente
        Then Aparece a mensagem seguinte mensagem
            | Mensagem | Email já cadastrado |

    Scenario: Não é possivel atualizar E-mail com mais de 60 caracteres
        And clico no campo E-mail
        Then Atualizo o email do usuário 
            | Email | joventaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa@gmail.com |
            Then Aparece a mensagem seguinte mensagem
            | Mensagem | Informe no máximo 100 caracteres. |

    Scenario: Não é possivel salvar usuário sem email
        And clico no campo E-mail
        When Deleto o E-mail cadastrado 
        Then Aparece a mensagem seguinte mensagem
            | Mensagem | Informe seu e-mail |

    Scenario Outline: Não é possível salvar com E-mail inválido
        And clico no campo E-mail
        When Atualizo o email do usuário 
        Then Aparece a mensagem seguinte mensagem
            | Mensagem | Formato de e-mail inválido. |

        Examples:
            | Email | <Email>               |
            | Email | joventinagmail.com    |
            | Email | joventina@gmail       |
            | Email | joventina @gmail.com  |
            | Email | joventina@gmail.com'  |
            | Email | joventina@gmail.com"  |
            | Email | joventina&@gmail.com  |
            | Email | joventina#@gmail.com  |
            | Email | joventina=@gmail.com  |
            | Email | joventina-@gmail.com  |
            | Email | joventina+@gmail.com  |
            | Email | joventina,@gmail.com  |
            | Email | joventina..@gmail.com |
            
    Scenario: Validar o botão histórico
        When clico no botão hitórico
        Then aparece meu histórico de lista de compras

    Scenario: Validar o botão lista
        When clico no botão lista
        Then aparece minha lista de compras

    Scenario: Validar botão sair
        When Clico no menu de opções
        And clico no sair
        Then Saio da conta 