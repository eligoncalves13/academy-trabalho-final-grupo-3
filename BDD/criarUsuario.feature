Feature: Criar usuário
    Como uma pessoa qualquer
    Desejo me registrar no sistema
    Para ter acesso as funcionalidades de lista de compras

    Background: Acessar cadastro 
        Given acessei o sistema Lembra Compras
        And acessei a tela de cadastro
    
    Scenario Outline: Deve ser possível cadastrar usuário com dados válidos
        When informo os dados válidos do usuário para cadastrar 
        | nome            | <nome>            |
        | email           | <email>           |
        | senha           | <senha>           |
        | confirmar_senha | <confirmar_senha> |
        Then visualizo a mensagem de sucesso "<mensagem>"
        Examples: 
            | nome                                                                                                 | email                                                        | senha                           | confirmar_senha                | mensagem                    |
            | Raro                                                                                                 | raro@academy.com                                             | 1234                            | 1234                           | Usuário criado com sucesso! |
            | Raro Academy                                                                                         | r@a.com                                                      | 123456789123456789123456789123  | 123456789123456789123456789123 | Usuário criado com sucesso! |
            | Raro Academy Wacky League Antlez Broke the Stereo Neon Tide Bring Back Honesty Coalition Feedback Ha | raro@a.com                                                   | 1234                            | 1234                           | Usuário criado com sucesso! |
            | Raro Name                                                                                            | raroleagueantlezbrokestereoneontidebringbackhonesty@raro.com | 1234                            | 1234                           | Usuário criado com sucesso! |

    Scenario Outline: Não deve ser possível cadastrar usuário sem informar todos os dados 
        When informo os dados do usuário para cadastrar
        | nome            | <nome>            |
        | email           | <email>           |
        | senha           | <senha>           |
        | confirmar_senha | <confirmar_senha> |
        Then visualizo a mensagem de erro "<mensagem>"
        Examples: 
            | nome | email            | senha | confirmar_senha | mensagem           | 
            |      | raro@academy.com | 1234  | 1234            | Informe seu nome   |
            | Raro |                  | 1234  | 1234            | Informe seu e-mail |
            | Raro | raro@academy.com |       | 1234            | Informe sua senha  |
            | Raro | raro@academy.com | 1234  |                 | Informe sua senha  |

    Scenario Outline: Não deve ser possível cadastrar usuário com email inválido
        When informo os dados do usuário para cadastrar
        | nome            | <nome>            |
        | email           | <email>           |
        | senha           | <senha>           |
        | confirmar_senha | <confirmar_senha> |
        Then visualizo a mensagem de erro "<mensagem>"
        Examples: 
            | nome  | email             | senha | confirmar_senha | mensagem                    |
            | Raro  | raro              | 1234  | 1234            | Formato de e-mail inválido. |
            | Raro  | raro@             | 1234  | 1234            | Formato de e-mail inválido. |
            | Raro  | raro.             | 1234  | 1234            | Formato de e-mail inválido. |
            | Raro  | raro@academy      | 1234  | 1234            | Formato de e-mail inválido. |
            | Raro  | raro#@academy.com | 1234  | 1234            | Formato de e-mail inválido. |

    Scenario: Não deve ser possível cadastrar usuário com email já existente
        When informo os dados do usuário com email já existente para cadastrar
        | nome            | Raro             |
        | email           | raro@academy.com |
        | senha           | 1234             |
        | confirmar_senha | 1234             |
        Then visualizo a mensagem de erro "Este e-mail já é utilizado por outro usuário."
                
    Scenario: Não deve ser possível cadastrar usuário com nome com mais de 100 caracteres
        When informo os dados do usuário para cadastrar
        | nome            | Raro Wacky League Antlez Broke the Stereo Neon Tide Bring Back Honesty Coalition Feedback Hand of Aces |
        | email           | raro@academy.com |
        | senha           | 1234 |
        | confirmar_senha | 1234 |
        Then visualizo a mensagem de erro "Informe no máximo 100 letras no seu nome"

    Scenario: Não deve ser possível cadastrar usuário com email com mais de 60 caracteres
        When informo os dados do usuário para cadastrar
        | nome            | Raro |
        | email | raroleagueantlezbrokestereoneontidebringbackhonestys@raro.com |
        | senha           | 1234 |
        | confirmar_senha | 1234 |
        Then visualizo a mensagem de erro "Informe no máximo 60 caracteres."

    Scenario Outline: Não deve ser possível cadastrar usuário com nome inválido
        When informo os dados do usuário para cadastrar
        | nome            | <nome>            |
        | email           | <email>           |
        | senha           | <senha>           |
        | confirmar_senha | <confirmar senha> |
        Then visualizo a mensagem de erro "<mensagem>"
        Examples: 
            | nome  | email             | senha | confirmar_senha | mensagem                    |
            | R@ro  | raro@academy.com  | 1234  | 1234            | Formato do nome é inválido. |
            | R123  | raro@academy.com  | 1234  | 1234            | Formato do nome é inválido. |
            | R#Ro  | raro@academy.com  | 1234  | 1234            | Formato do nome é inválido. |
            | Ra-Ro | raro@academy.com  | 1234  | 1234            | Formato do nome é inválido. |
            | Ra$Ro | raro@academy.com  | 1234  | 1234            | Formato do nome é inválido. |
            | ....  | raro@academy.com  | 1234  | 1234            | Formato do nome é inválido. |

    Scenario Outline: Não deve ser possível criar usuário com nome com menos de 4 caracteres válidos
        When informo os dados do usuário para cadastrar
        | nome            | <nome>            |
        | email           | <email>           |
        | senha           | <senha>           |
        | confirmar_senha | <confirmar_senha> |
        Then visualizo a mensagem de erro "<mensagem>"
        Examples: 
            | nome  | email             | senha | confirmar_senha | mensagem                  |
            | Rar   | raro@academy.com  | 1234  | 1234            | Informe seu nome completo |
            |  Rar  | raro@academy.com  | 1234  | 1234            | Informe seu nome completo |
            |   R   | raro@academy.com  | 1234  | 1234            | Informe seu nome completo |

    Scenario: Não deve ser possível cadastrar usuário com senha com mais de 30 caracteres
        When informo os dados do usuário para cadastrar
        | nome            | Raro                            |
        | email           | raro@academy.com                |
        | senha           | 1234567891234567891234567891234 |
        | confirmar_senha | 1234567891234567891234567891234 |
        Then visualizo a mensagem de erro "Informe no máximo 30 caracteres."
    
    Scenario: Não deve ser possível cadastrar usuário com senhas diferentes
        When informo os dados do usuário para cadastrar
        | nome            | Raro             |
        | email           | raro@academy.com |
        | senha           | 1234             |
        | confirmar_senha | 12345            |
        Then visualizo a mensagem de erro "As senhas não conferem."

    Scenario: Deve ser possível ir para a tela de login 
        When seleciono para voltar à página de login
        Then visualizo a tela de login

    Scenario: Deve ser possível visualizar a senha 
        When informo a senha do usuário para cadastrar
        | senha | 12345 |
        And seleciono para mostrar senha 
        Then visualizo a senha em formato de texto

    Scenario: Deve ser possível visualizar a senha de confirmação
        When informo a confirmação de senha do usuário para cadastrar
        | confirmar_senha | 12345 |
        And seleciono para mostrar senha de confirmação
        Then visualizo a confirmação de senha em formato de texto