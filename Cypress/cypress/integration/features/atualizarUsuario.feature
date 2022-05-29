Feature: Atualizar usuario
    Como um usuário com conta no sistema
    Desejo atualizar minhas informações básicas
    Para manter meus dados atualizados no sistema.

    Background: Acessar o sistema
        Given acessei o sistema Lembra Compras
        When informo os dados válidos do usuário para cadastrar e logar no sistema
        Then visualizo o perfil no menu de opções

    @ignore
    Scenario: Deve ser possível atualizar nome do usuário com sucesso
        When informo o nome válido para editar o perfil
        Then visualizo a mensagem de sucesso "Informações atualizadas com sucesso!"

     @ignore
    Scenario: Não deve ser possível editar usuário com dados inválidos
        When informo o nome os dados inválidos
        Then visualizo a mensagem de erro "Informe no máximo 100 letras no seu nome"

    @ignore
     Scenario: Não deve ser possível salvar usuário sem nome
        When não informo nome do usuário
        Then visualizo a mensagem de erro "Informe seu nome"

    @ignore
    Scenario: Não deve ser possível salvar nome com números ou caracteres especiais
        When informo o nome do usuário
            | nome | @na Luiza |
            | nome | Ana Lu1za |
            | nome | Ana Lu-iza |
        Then visualizo a mensagem de erro "Formato do nome é inválido."

    @ignore
    Scenario: Deve ser possível atualizar E-mail do usuário com sucesso
        When informo o email válido para editar o perfil
        Then visualizo a mensagem de sucesso "Informações atualizadas com sucesso!"

    @ignore
    Scenario: Não deve ser possível cadastrar email utilizado por outro usuário
        When Informo e-mail já utilizado por outro usuário
        Then visualizo a mensagem de erro "Informações atualizadas com sucesso!"

    @ignore
    Scenario: Não deve ser possível atualizar E-mail com mais de 60 caracteres
        When informo o email com os dados inválidos
        Then visualizo a mensagem de erro "Informe no máximo 60 caracteres."

    @ignore
    Scenario: Não aparece a mensagem no campo email "informe no máximo 60 caracteres"
        When informo o email com 101 caracteres
        Then visualizo a mensagem de erro no campo email "Informe no máximo 60 caracteres."    