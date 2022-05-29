# Testes automatizados de API com Karate Framework

Teste automatizado da API do [Lembra Compras](https://lista-compras-api.herokuapp.com/api-docs/#/) com o framework Karate DSL.

## Dependências 

- [Java 8](https://www.oracle.com/br/java/technologies/javase/javase8-archive-downloads.html)
- [Karate DSL]()

## Configurando ambiente

### 1. Instalação do Java

- Acesse [JDK 8 - Download](https://www.oracle.com/br/java/technologies/javase/javase8-archive-downloads.html) 
- Selecione a opção de dowload conforme a versão do seu  Sistema Operacional (Windows, Mac OS, Linux).

### 2. Configuração de variáveis de ambiente

- **Windows**:

  - Acesse ``Editar as variáveis de ambiente do sistema`` no menu de pesquisa do Windows

  - No canto inferior direito, acesse ``Variáveis de ambiente``

  - Em `Variáveis do sistema`, clique em `novo`

  - No campo ``Nome da variável``, insira ``JAVA_HOME``

  - No campo ``Valor da variável``, insira o seu caminho de instalação do Java

  - Em ``Variáveis de usuário``, localize a variável ``Path``

  - Clique em ``Editar``

  - Clique em ``Novo`` para adicionar uma nova linha

  - Acrescente na nova linha o seguinte: ``%JAVA_HOME%\bin``

    **Testando a configuração**

    - Abra o prompt de comando
    - Escreva o comando ``echo %JAVA_HOME%``. O prompt deverá exibir o local de instalação do Java
    - Escreva o comando ``java -version``. O prompt deverá exibir a versão do Java que está instalada em seu computador

- **Mac OS**:

  - Acesse o terminal 

  - Execute o comando `cd ~`

  - Execute o comando `vi .bash_profile`

  - Ative o modo de edição de texto teclando a letra `i`

  - Edite o arquivo para configurar as variáveis de ambiente

    ```
    export JAVA_HOME=$(/usr/libexec/java_home)
    export PATH=$JAVA_HOME/bin:$PATH
    ```

  - Saia do modo de edição teclando `ESC`

  - Salve o arquivo teclando `:wq` e pressionando `enter`

### 3. Clone esse repositório 

- Clone esse repositório 
  - `git clone https://github.com/eligoncalves13/academy-trabalho-final-grupo-3.git` 
- Abra o projeto no prompt de comando
  - `cd academy-trabalho-final-grupo-3`

## Execução do teste 

- Rodar todos os arquivo 

  -  `java -jar karate.jar *.feature` 
- RodaR um arquivo 

  -  `java -jar karate.jar NOME_DO_ARQUIVO.feature`


