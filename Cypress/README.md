# Testes automatizados de Frontend com framework Cypress

## Configurando ambiente

Primeiro é preciso instalar o [Node](https://nodejs.org/en/download/).

## 1. Instalação NodeJS: 

1. Acesse a página de [download do NodeJS](https://nodejs.org/en/download/);

2. Selecione a versão compatível com seu sistema operacional;

3. Execute o programa instalador que foi baixado e inicie a instalação. Nao é necessário marcar as ferramentas extras;

4. Verifique se o NodeJS está instalado executando o comando abaixo em um terminal de sua preferência. O resultado deste comando deverá ser o número da versão do NodeJS que foi instalado.<br>**Obs:** Após instalar o NodeJS, reinicie todos os terminais e editores como o VS Code;

```sh
node --version
```

5. Verifique se o npm foi instalado executando o comando abaixo em um terminal de sua preferência. O resultado deste comando deverá ser o número da versão do npm que foi instalado junto do NodeJS.

```sh
npm --version
```

## 2. Execução dos testes

1. Clone esse repositório
```sh
git clone https://github.com/eligoncalves13/academy-trabalho-final-grupo-3.git
```
2. Entre na pasta do projeto;
```sh
cd academy-trabalho-final-grupo-3/Cypress
```
3. Execute o comando abaixo para instalar as dependências;
```sh
npm install
```
4. Execute o comando abaixo para abrir o cypress;
```sh
npx cypress open
```
5. Aguarde abrir o Cypress

6. Para executar apenas uma feature, escolha e clique sobre a feature

7. Para executar todas as features, clique em **Run 5 integration specs**