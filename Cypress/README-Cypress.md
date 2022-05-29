# Testes automatizados de Frontend utilizando o framework Cypress

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

## 2. Executando os testes no Cypress

1. No GitHub baixar o projeto em formato .ZIP (code -> Download ZIP)

2. Extraia o .ZIP em uma pasta no computador;

3. Abra o VS Code;

4. Abra a pasta onde foi extraido o .ZIP no VS Code;

5. Abra o terminal dentro do VS Code;

6. Execute o comando abaixo através do terminal do VS Code, para entrar na pasta Cypress;
```sh
cd Cypress
```
7. Execute o comando abaixo através do terminal do VS Code, para instalar as dependências;
```sh
npm install
```
8. Execute o comando abaixo através do terminal do VS Code, para abrir o cypress;
```sh
npx cypress open
```
9. Aguarde abrir o Cypress para executar os testes