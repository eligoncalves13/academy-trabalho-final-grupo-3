@cadastrarUsuarioLogin
@deletarUsuario
@logout

Feature: Gestão de lista de compras
        Como um usuário com conta no sistema
        Desejo gerenciar uma lista de compras
        Para registrar os produtos que desejo comprar

    Background: Informo os dados de usuário para cadastrar e logar
        Given acessei o sistema Lembra Compras

        Scenario: Criar lista com sucesso            
            When informo os campos de criação da lista
            | descricao   | Feirinha                 |
            | nome        | Pastel                   |
            | quantidade  | 1                        |
            Then visualizo a mensagem positiva "Lista concluída com sucesso!" 
            
        Scenario: Criar uma lista sem descricao, dado que ao menos um item tenha sido adicionado
             When informo, sem a descricao, os campos de criação da lista
             | descricao   |                          |
             | nome        | Pastel                   |
             | quantidade  | 2                        |
             Then visualizo a mensagem positiva "Lista concluída com sucesso!" 

        Scenario Outline: A quantidade limite de um item deve ser respeitada
            When informo, desrespeitando os limites de quantidade, os campos de criação da lista
            | descricao   |     <descricao>       |
            | nome        |     <nome>            |
            | quantidade  |     <quantidade>      |
            Then visualizo a mensagem de erros "<mensagem>"
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
                | descricao  |              nome                         | quantidade    |            mensagem                    | 
                | Feirinha   | Ja!ca#                                    | 2             |   Formato do nome é inválido.          | 
                | Mercado    | PeraUvaMaçaSaladaPeraUvaMaçaSaladaPera    |  3            |  Informe no máximo 30 caracteres       | 
                | Natal      | T                                         |   4           |  Informe o nome do produto             |

        Scenario Outline: Deve ser possível visualizar a quantidade total do item quando adicionado uma nova quantidade   
            When informo os campos de criação da lista, acrescentando um item
            | descricao   |     <descricao>       |
            | nome        |     <nome>            |
            | quantidade  |     <quantidade>      |
            And acrescento um item com nome já presente
            | nome        |     <nome_novo>            |
            | quantidade  |     <quantidade_nova>      |
            And salvo a lista 
            Then visualizo "<resultado>" na soma dos itens
            Examples: 
                | descricao  | nome  | quantidade | nome_novo | quantidade_nova | resultado |
                | Ano Novo   | Peru  |  1         | Peru      |       1         |     2     |
                | Ano Novo   | Torta |  3         | Torta     |       5         |     8     |

        Scenario: Sistema permite adicionar nome de item com número
            When informo o nome do item com número
            | descricao   | Feirinha Numérica      |
            | nome        | 50                     |
            | quantidade  | 13                     |
            Then visualizo a mensagem positiva "Lista concluída com sucesso!"     

        Scenario: Não deve ser possível atualizar quantidade do item maior que 1000 unidades quando está criando a lista
            When informo os campos de criação da lista, acrescentando um item
            | descricao  | mercado |
            | nome       | milho   |
            | quantidade | 999     |
            And acrescento um item com nome já presente 
            | nome       | milho   |
            | quantidade | 2       |
            And salvo a lista 
            Then visualizo a mensagem negativa "Não foi possível criar a lista de compras 🥺"

        Scenario: Não deve ser possível atualizar quantidade do item maior que 1000 unidades quando a lista já está criada
            When informo os campos de criação da lista, acrescentando um item
            | descricao  | mercado |
            | nome       | milho   |
            | quantidade | 999     |
            And salvo a lista 
            And acrescento um item com nome já presente 
            | nome       | milho   |
            | quantidade | 2       |
            Then visualizo a mensagem negativa "Não é permitido incluir mais de 1000 unidades do produto."

        Scenario: Deve ser possível marcar item como concluído
            When informo os campos de criação da lista, acrescentando um item
            | descricao  | mercado |
            | nome       | leite   |
            | quantidade | 5       |
            And salvo a lista 
            And marco o item como concluído 
            Then o item é riscado da lista 

        Scenario: Deve ser possível finalizar a lista de compras 
            When informo os campos de criação da lista, acrescentando um item 
            | descricao  | mercado |
            | nome       | feijão  |
            | quantidade | 1       |
            And salvo a lista 
            And seleciono para finalizar a lista 
            And confirmo a finalização da lista
            Then visualizo a mensagem positiva "Lista concluída com sucesso!"

        Scenario: O status de concluído do item não deve ser alterado ao recarregar a página 
            When informo os campos de criação da lista, acrescentando um item 
            | descricao  | mercado |
            | nome       | arroz   |
            | quantidade | 1       |
            And salvo a lista 
            And marco o item como concluído 
            And atualizo a página
            Then o item deve permanecer riscado 

        Scenario: Deve ser possível fechar o modal de finalizar lista
            When informo os campos de criação da lista, acrescentando um item 
            | descricao  | mercado |
            | nome       | queijo  |
            | quantidade | 3       |
            And salvo a lista 
            And seleciono para finalizar a lista 
            And seleciono para fechar a modal 
            Then a modal é fechada sem finalizar a lista 