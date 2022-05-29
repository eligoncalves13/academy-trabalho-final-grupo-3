import { Before } from "cypress-cucumber-preprocessor/steps";
import { faker } from '@faker-js/faker';
import { loginUsuarioPage } from "../pages/loginUsuario.po";
import loginResposta from "../../fixtures/token.json";

const login = {
    emailLogin: faker.internet.email().toLowerCase(),
    senhaLogin: faker.internet.password()
}

Before({ tags: "@logout" }, () => {
    cy.logout();
});

Given("acessei o sistema Lembra Compras", () => {
    loginUsuarioPage.acessarLogin();
});

When("informo os dados válidos para efetuar o login", () => {
    cy.intercept('POST', "api/v1/auth/login", {
        statusCode: 200,
        body: loginResposta
    });
    loginUsuarioPage.preencherLogin(login.emailLogin, login.senhaLogin);
});

When("informo os dados não cadastrados no sistema para efetuar o login", () => {
    cy.intercept('POST', "api/v1/auth/login", {
        statusCode: 403,
        body: {
            error: "Invalid email or password."
        }
    });
    loginUsuarioPage.preencherLogin(login.emailLogin, login.senhaLogin);
});

When("informo os dados do usuário para efetuar o login", (dados) => {
    var dadosLoginUsuario = dados.rowsHash();
    if (dadosLoginUsuario.emailLogin) {
        loginUsuarioPage.preencherEmailLogin(dadosLoginUsuario.emailLogin);
    }
    if (dadosLoginUsuario.senhaLogin) {
        loginUsuarioPage.preencherSenhaLogin(dadosLoginUsuario.senhaLogin);
    }
    if (dadosLoginUsuario.emailLogin && dadosLoginUsuario.senhaLogin) {
        loginUsuarioPage.preencherEmailLogin(dadosLoginUsuario.emailLogin);
        loginUsuarioPage.preencherSenhaLogin(dadosLoginUsuario.senhaLogin);
    }
    loginUsuarioPage.clicarBotaoEntrar();
});

When("informo os dados inválido para efetuar o login", (dados) => {
    var dadosLoginUsuario = dados.rowsHash();
    loginUsuarioPage.preencherLoginComDadosInvalidos(dadosLoginUsuario.emailLogin, dadosLoginUsuario.senhaLogin);
});

When("não informo os dados do usuário", () => {
});

And("acesso a opção registrar um novo usuário", () => {
    loginUsuarioPage.clicarEmRegistreSe();
});

Then("visualizo as demais funcionalidades do sistema", () => {
    cy.intercept('GET', "api/v1/list", {
        statusCode: 200,
        body: []
    });
    loginUsuarioPage.exibePaginaCriarLista();
});

Then("visualizo a mensagem informando que e-mail ou senha estão incorretos {string}", (mensagemErroLogin) => {
    loginUsuarioPage.exibirMensagemErroEmailOuSenhaIncorretos(mensagemErroLogin);
});

Then("visualizo a mensagem solicitando o preenchimento dos dados {string}", (mensagensErroLogin) => {
    loginUsuarioPage.exibirMensagensErroLogin(mensagensErroLogin.split(';'));
});

Then("visualizo a mensagem informando que os dados são inválidos {string}", (mensagemErroLogin) => {
    loginUsuarioPage.exibirMensagensErroLogin([mensagemErroLogin]);
});

Then("visualizo o formulário para registrar um novo usuário", () => {
    loginUsuarioPage.exibeFormularioParaCadastrarNovoUsuario();
});