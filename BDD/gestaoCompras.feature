
Funcionalidade: Gestão de lista de compras
        Como um usuário com conta no sistema
        Desejo gerenciar uma lista de compras
        Para registrar os produtos que desejo comprar

        Background: Acessar o sistema
            Given acessei o sistema Lembra Compras

        Scenario: Criar lista com sucesso
            When informo os campos de criação da lista
            | descricao   | Feirinha                 |
            | nome_item   | Pastel                   |
            | quantidade  | 1                        |
            Then visualizo a mensagem positiva "Lista concluída com sucesso!" 
            # (incluir click dos botões +, salvar,finalizar e confirmar)
            
        Scenario: Criar uma lista sem descricao, dado que ao menos um item tenha sido adicionado
            When informo, sem a descricao, os campos de criação da lista
            | descricao   |                          |
            | nome_item   | Pastel                   |
            | quantidade  | 2                        |
            Then visualizo a mensagem positiva "Lista concluída com sucesso!" 
            # (incluir click dos botões +, salvar,finalizar e confirmar)

        Scenario: A quantidade mínima de um item na lista deve ser de 1 unidade
            When informo, sem incluir quantidade, os campos de criação da lista
            | descricao   | Feirinha Feliz           |
            | nome_item   | Pastel                   |
            | quantidade  |                          |
            Then visualizo a mensagem negativa "Adicione pelo menos um item na sua lista de compras" 
            # (essa mensagem é no é no salvar) no + tem outra mensagem: Informe pelo menos 1 unidade

        Scenario: A quantidade máxima de um item na lista deve ser de 1000 unidades
            When informo, extrapolando a quantidade máxima, os campos de criação da lista
            | descricao   | Feirinha Feliz            |
            | nome_item   | Pastéis                   |
            | quantidade  | 1001                      | 
            Then visualizo a mensagem negativa "Informe uma quantidade menor ou igual a 1000"
            # (essa mensagem é no é no +)

        Scenario Outline: Não deve ser possível adicionar item com nome inválido
            When informo o nome do item com formato inválido
            | descricao   | <descricao>            |
            | nome_item   | <nome>                 |
            Then vizualizo a mensagem de erro "<mensagem>"
            Examples: 
                | descricao |              nome_item                    |            mensagem               |
                | Feirinha   | Ja!ca#                                   | Formato do nome é inválido.       |
                | Mercado    | PeraUvaMaçaSaladaPeraUvaMaçaSaladaPera   | Informe no máximo 30 caracteres   |
                | Natal      | T                                        | Informe o nome do produto         |

        Scenario: Adicionar item já presente na lista, desde que seja uma unidade, e depois acrescentar um novo com qualquer unidade, soma sua quantidade
            When informo os campos de criação da lista, o primeiro item possui 1 unidade
            | descricao   | Ano Novo              |
            | nome_item   | Peru                  |
            | quantidade  | 1                     |
            And acrescento um item com nome já presente       
            | nome_item   | Peru                  |
            | quantidade  | 5                     |
            Then visualizo a soma dos itens
            # (incluir click dos botões +)

        Scenario: Adicionar item já presente na lista, com qualquer unidade, salvar, e depois acrescentar um novo, soma sua quantidade
            When informo os campos de criação da lista, o primeiro item possui 5 unidades
            | descricao   | Natal                 |
            | nome_item   | Peru                  |
            | quantidade  | 5                     |
            And salvo e acrescento um item com nome já presente       
            | nome_item   | Peru                  |
            | quantidade  | 5                     |
            Then visualizo a soma dos itens
            # (incluir click dos botões +)

        Scenario: Adicionar item já presente na lista, com o primeiro item sendo maior que uma unidade, concatena sua quantidade
            When informo os campos de criação da lista, o primeiro item possui mais de 1 unidade
            | descricao   | Natal                 |
            | nome_item   | Peru                  |
            | quantidade  | 3                     |
            And acrescento um item com nome já presente       
            | nome_item   | Peru                  |
            | quantidade  | 4                     |
            Then visualizo a concatenação dos itens
        
        Scenario: Sistema permite adicionar nome de item com número
            When informo o nome do item com número
            | descricao   | Feirinha Numérica      |
            | nome_item   | 50                     |
            | quantidade  | 13                     |
            Then visualizo a mensagem positiva "Lista concluída com sucesso!"     
