Feature: Gestão de lista de compras
        Como um usuário com conta no sistema
        Desejo gerenciar uma lista de compras
        Para registrar os produtos que desejo comprar

    Background: Acessar o sistema, efetuar login 
        Given acessei o sistema Lembra Compras
        And informo os dados válidos para efetuar o login

        # Scenario: Preencher dados corretos
        #     Given acessei a tela de cadastro
        #     When preencho o formulário e salvo
        #     | nome  | Carmem                                            |
        #     | email | testes@oi.com                                     |
        #     | senha | carmem                                            |
        #     | confirmar_senha | carmem                                  |
        #     Then visualizo a mensagem positiva "Usuário criado com sucesso!"

        # Scenario: Login
        #     Given acessei a tela de login
        #     When preencho os dados de Login
        #     | email | testes@oi.com                                     |
        #     | senha | carmem                                            |
        #     Then visualizo as demais funcionalidades do sistema 

        Scenario: Criar lista com sucesso
            When informo os campos de criação da lista
            | descricao   | Feirinha                 |
            | nome        | Pastel                   |
            | quantidade  | 1                        |
            Then visualizo a mensagem positiva "Lista concluída com sucesso!" 
            
        # Scenario: Criar uma lista sem descricao, dado que ao menos um item tenha sido adicionado
        #      When informo, sem a descricao, os campos de criação da lista
        #      | descricao   |                          |
        #      | nome_item   | Pastel                   |
        #      | quantidade  | 2                        |
        #      Then visualizo a mensagem positiva "Lista concluída com sucesso!" 

        Scenario Outline: A quantidade limite de um item deve ser respeitada
            When informo, desrespeitando os limites de quantidade, os campos de criação da lista
            | descricao   |     <descricao>       |
            | nome        |     <nome>            |
            | quantidade  |     <quantidade>      |
            Then visualizo a mensagem de erro "<mensagem>"
            Examples: 
                |       descricao               | nome            | quantidade      | mensagem                                     | 
                |     Mercadinho                | jaca            | 0               | Informe pelo menos 1 unidade                 |
                |       feira                   | feijão          | 1001            | Informe uma quantidade menor ou igual a 1000 |

        Scenario Outline: Não deve ser possível adicionar item com nome inválido
            When informo o nome do item com formato inválido
            | descricao   |     <descricao>       |
            | nome        |     <nome>            |
            | quantidade  |     <quantidade>      |
            Then visualizo a mensagem negativa "<mensagem>"
            Examples: 
                | descricao  |              nome                         | quantidade    |            mensagem                   | 
                | Feirinha   | Ja!ca#                                    | 2             |   Formato do nome é inválido.          | 
                | Mercado    | PeraUvaMaçaSaladaPeraUvaMaçaSaladaPera    |  3            |  Informe no máximo 30 caracteres       | 
                | Natal      | T                                         |   4           |  Informe o nome do produto             |


        # Scenario: Adicionar item já presente na lista, desde que seja uma unidade, e depois acrescentar um novo com qualquer unidade, soma sua quantidade
        #     When informo os campos de criação da lista, o primeiro item possui 1 unidade
        #     | descricao   | Ano Novo              |
        #     | nome_item   | Peru                  |
        #     | quantidade  | 1                     |
        #     And acrescento um item com nome já presente       
        #     | nome_item   | Peru                  |
        #     | quantidade  | 5                     |
        #     Then visualizo a soma dos itens
        #     # (incluir click dos botões +)

        # Scenario: Adicionar item já presente na lista, com qualquer unidade, salvar, e depois acrescentar um novo, soma sua quantidade
        #     When informo os campos de criação da lista, o primeiro item possui 5 unidades
        #     | descricao   | Natal                 |
        #     | nome_item   | Peru                  |
        #     | quantidade  | 5                     |
        #     And salvo e acrescento um item com nome já presente       
        #     | nome_item   | Peru                  |
        #     | quantidade  | 5                     |
        #     Then visualizo a soma dos itens
        #     # (incluir click dos botões +)

        # Scenario: Adicionar item já presente na lista, com o primeiro item sendo maior que uma unidade, concatena sua quantidade
        #     When informo os campos de criação da lista, o primeiro item possui mais de 1 unidade
        #     | descricao   | Natal                 |
        #     | nome_item   | Peru                  |
        #     | quantidade  | 3                     |
        #     And acrescento um item com nome já presente       
        #     | nome_item   | Peru                  |
        #     | quantidade  | 4                     |
        #     Then visualizo a concatenação dos itens
        
        Scenario: Sistema permite adicionar nome de item com número
            When informo o nome do item com número
            | descricao   | Feirinha Numérica      |
            | nome        | 50                     |
            | quantidade  | 13                     |
            Then visualizo a mensagem positiva "Lista concluída com sucesso!"     

        # Scenario: Não deve ser possível atualizar quantidade do item maior que 1000 unidades quando está criando a lista
        #     When informo os campos de criação da lista, acrescentando um item
        #     | descricao  | mercado |
        #     | nome_item  | milho   |
        #     | quantidade | 999     |
        #     And acrescento um item com nome já presente 
        #     | nome_item  | milho   |
        #     | quantidade | 2       |
        #     And salvo a lista 
        #     Then visualizo a mensagem negativa "Não é permitido incluir mais de 1000 unidades do produto."

        # Scenario: Não deve ser possível atualizar quantidade do item maior que 1000 unidades quando a lista já está criada
        #     When informo os campos de criação da lista, acrescentando um item
        #     | descricao  | mercado |
        #     | nome_item  | milho   |
        #     | quantidade | 999     |
        #     And salvo a lista 
        #     And acrescento um item com nome já presente 
        #     | nome_item  | milho   |
        #     | quantidade | 2       |
        #     Then visualizo a mensagem negativa "Não é permitido incluir mais de 1000 unidades do produto."

        # Scenario: Deve ser possível marcar item como concluído
        #     When informo os campos de criação da lista, acrescentando um item
        #     | descricao  | mercado |
        #     | nome_item  | leite   |
        #     | quantidade | 5       |
        #     And salvo a lista 
        #     And marco o item como concluído 
        #     Then o item é riscado da lista 

        # Scenario: Deve ser possível finalizar a lista de compras 
        #     When informo os campos de criação da lista, acrescentando um item 
        #     | descricao  | mercado |
        #     | nome_item  | feijão  |
        #     | quantidade | 1       |
        #     And salvo a lista 
        #     And seleciono para finalizar a lista 
        #     And confirmo a finalização da lista 
        #     Then visualizo a mensagem positiva "Lista concluída com sucesso!"

        # Scenario: O status de concluído do item não deve ser alterado ao recarregar a página 
        #     When informo os campos de criação da lista, acrescentando um item 
        #     | descricao  | mercado |
        #     | nome_item  | arroz   |
        #     | quantidade | 1       |
        #     And salvo a lista 
        #     And marco o item como concluído 
        #     And atualizo a página
        #     Then o item deve permanecer riscado 

        # Scenario: Deve ser possível fechar o modal de finalizar lista
        #     When informo os campos de criação da lista, acrescentando um item 
        #     | descricao  | mercado |
        #     | nome_item  | queijo  |
        #     | quantidade | 3       |
        #     And salvo a lista 
        #     And seleciono para finalizar a lista 
        #     And seleciono para fechar a modal 
        #     Then a modal é fechada sem finalizar a lista 