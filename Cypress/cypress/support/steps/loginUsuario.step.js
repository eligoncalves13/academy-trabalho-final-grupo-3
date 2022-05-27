import { loginUsuarioPage } from "../pages/loginUsuario.po";
import loginResposta from "../../fixtures/token.json";
import login from "../../fixtures/login.json";

Given("acessei o sistema Lembra Compras", () => {
    loginUsuarioPage.acessarLogin();
});
When("informo os dados válidos para efetuar o login", () => {
    cy.intercept('POST', "api/v1/auth/login", {
        statusCode: 200,
        body: loginResposta
    });
    loginUsuarioPage.preencherLogin();
});
When("informo os dados não cadastrados no sistema para efetuar o login", () => {
    cy.intercept('POST', "api/v1/auth/login", {
        statusCode: 403,
        body: {
            error: "Invalid email or password."
        }
    });
    loginUsuarioPage.preencherLogin();
});
When("informo os dados do usuário para efetuar o login", (dados) => {
    var dadosLoginUsuario = dados.rowsHash();
    if (dadosLoginUsuario.emailLogin)
        loginUsuarioPage.preencherEmailLogin(dadosLoginUsuario.emailLogin);

    if (dadosLoginUsuario.senhaLogin)
        loginUsuarioPage.preencherSenhaLogin(dadosLoginUsuario.senhaLogin);

    loginUsuarioPage.clicarBotaoEntrar();
});
When("informo os dados inválido para efetuar o login", (dados) => {
    var dadosLoginUsuario = dados.rowsHash();
    loginUsuarioPage.preencherLoginComDadosInvalidos(dadosLoginUsuario.emailLogin, dadosLoginUsuario.senhaLogin);
});
When("não informo os dados do usuário", () => {
});
Then("visualizo as demais funcionalidades do sistema", () => {
    loginUsuarioPage.exibePaginaCriarLista();
});
Then("visualizo a mensagem informando que e-mail ou senha estão incorretos {string}", (mensagemErroLogin) => {
    loginUsuarioPage.exibirMensagemErroEmailOuSenhaIncorretos(mensagemErroLogin);
});
Then("visualizo a mensagem solicitando o preenchimento dos dados {string}", (mensagemErroLogin) => {
    loginUsuarioPage.exibirMensagemErroLogin(mensagemErroLogin);   
});
Then("visualizo a mensagem informando que os dados são inválidos {string}", (mensagemErroLogin) => {
    loginUsuarioPage.exibirMensagemErroLogin(mensagemErroLogin);
});
Then("seleciono para cadastrar um novo usuário", () => {
    loginUsuarioPage.clicarEmRegistreSe();
});
And("visualizo o formulário para cadastrar novo usuário", () => {
    loginUsuarioPage.exibeFormularioParaCadastrarNovoUsuario();
});