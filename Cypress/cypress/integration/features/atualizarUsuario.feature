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
         
    