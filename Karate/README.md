# Testes automatizados de API com Karate Framework

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

    - Abra o Prompt de comando
    - Escreva o comando ``echo %JAVA_HOME%``. O prompt deverá exibir o local de instalação do Java
    - Escreva o comando ``java -version``. O prompt deverá exibir a versão do Java que está instalada em seu computador

- **Mac OS**:

- **Linux**:

### 3. Instalação do Standalone Karate Framework

- Acesse [Releases do Karate](https://github.com/karatelabs/karate/releases)

- Localize a última ``release`` disponível contendo a tag ``Latest``
- Acesse a grade de ``Assets``
- Faça download do arquivo ``karate-1.2.0.RC1.jar``. ``Obs:`` Atente-se ao fato que o número da versão pode mudar

