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

        /// Rosicleia tudo que é nome em um cenario só
    Scenario: Não deve ser possivel atualizar um usuário com mais de 100 caracteres no campo nome
        And clico no campo Nome Completo
        Then Atualizo o nome do usuário
            | Nome | Maria Joventinaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa |
        Then Aparece a mensagem seguinte mensagem
            | Mensagem | Informe no máximo 100 letras no seu nome |

    Scenario: Não é possível salvar usuário sem nome
        And clico no campo Nome Completo
        When Deleto o nome cadastrado 
        Then Aparece a mensagem seguinte mensagem
            | Mensagem | Informe seu nome |

    Scenario: Não é possível salvar nome com números ou caracteres especiais
        And clico no campo Nome Completo
        When Atualizo o nome do usuário
            | Nome | @na Luiza |
            | Nome | Ana Lu1za |
            | Nome | Ana Lu-za |
        Then Aparece a mensagem seguinte mensagem
            | Mensagem | Formato do nome é inválido. |

    Scenario: Atualizar E-mail do usuário com sucesso
        And clico no campo E-mail
        When Atualizo o email do usuário 
            | Email | joventina@gmail.com |
        And clico em confirmar alterações
        And clico em confirmar novamente
        Then Aparece a mensagem seguinte mensagem
            | Mensagem | Informações atualizadas com sucesso! |

    Scenario: Email Não pode ser utilizado por outro usuário
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