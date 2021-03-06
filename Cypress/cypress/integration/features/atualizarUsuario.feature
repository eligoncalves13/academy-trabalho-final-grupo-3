@logout
Feature: Atualizar usuario
    Como um usuário com conta no sistema
    Desejo atualizar minhas informações básicas
    Para manter meus dados atualizados no sistema.

    Background: Acessar o sistema
        Given acessei o sistema Lembra Compras
        When informo os dados válidos do usuário para cadastrar e logar no sistema
        Then visualizo o perfil no menu de opções

    Scenario: Deve ser possível atualizar nome do usuário com sucesso
        When informo o nome válido para editar o perfil
        Then visualizo a mensagem de sucesso "Informações atualizadas com sucesso!"

    Scenario: Não deve ser possível editar usuário com dados inválidos
        When informo o nome com 101 caracteres
        | nome | Barnaby Marmaduke Aloysius Benjy Cobweb Dartagnan Egbert Felix Gaspar Humbert Ignatius Jayden Kasper Leroy Reinalts |
        Then visualizo a mensagem de erro "Informe no máximo 100 letras no seu nome"

    Scenario: Não deve ser possível salvar usuário sem nome
        When não informo nome do usuário
        Then visualizo a mensagem de erro "Informe seu nome"

     
    Scenario Outline: Não deve ser possível salvar nome com números ou caracteres especiais
        When informo o nome do usuário
            | nome | <nome> |
        Then visualizo a mensagem de erro "Formato do nome é inválido."
        Examples: 
            | nome       |
            | @na Luiza  |
            | Ana Lu1za  |
            | Ana Lu-iza |
    
    Scenario: Deve ser possível atualizar E-mail do usuário com sucesso
        When informo o email válido para editar o perfil
        Then visualizo a mensagem de sucesso "Informações atualizadas com sucesso!"

    Scenario: Não deve ser possível cadastrar email utilizado por outro usuário
        When Informo e-mail já utilizado por outro usuário
        Then visualizo a mensagem de erro "Este e-mail já é utilizado por outro usuário"

    Scenario: Não deve ser possível atualizar E-mail com mais de 60 caracteres
        When informo o email com os dados inválidos
        Then visualizo a mensagem de erro "Informe no máximo 60 caracteres."

    Scenario: Não aparece a mensagem no campo email "informe no máximo 60 caracteres"
        When informo o email com 101 caracteres
        Then visualizo a mensagem de erro no campo email "Informe no máximo 60 caracteres."

    Scenario: Não deve ser possivel salvar usuário sem email
        When não informo email do usuário
        Then visualizo a mensagem de erro "Informe seu e-mail"


    Scenario Outline: Não deve ser possível salvar com E-mail inválido 
        When informo o email do usuário
        | email | <email> |
        Then visualizo a mensagem de erro "Formato de e-mail inválido."
        Examples:
            | email                 |
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


    Scenario: deve ser possível selecionar o botão histórico
        When seleciono a opção histórico
        Then visualizo meu histórico de lista de compras

    
    Scenario: deve ser possível selecionar o botão lista
        When seleciono a opção lista
        Then visualizo minha lista de compras

    
    Scenario: deve ser possível selecionar o botão sair
        When seleciono a opção sair
        Then visualizo a tela de login