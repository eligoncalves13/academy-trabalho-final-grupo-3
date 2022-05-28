import { faker } from '@faker-js/faker';
import { loginUsuarioPage } from "../pages/loginUsuario.po";
import { historicoListaDeComprasPage } from "../pages/historicoListaDeCompras.po";
import loginResposta from "../../fixtures/token.json";
import lista from "../../fixtures/criarLista.json";
import responseLista from "../../fixtures/responseLista.json";

const login = {
    emailLogin: faker.internet.email().toLowerCase(),
    senhaLogin: faker.internet.password()
}

Given("acessei o sistema Lembra Compras", () => {
    loginUsuarioPage.acessarLogin();
});

And("informo os dados válidos para efetuar o login", () => {
    cy.intercept('POST', "api/v1/auth/login", {
        statusCode: 200,
        body: loginResposta
    });
    loginUsuarioPage.preencherLogin(login.emailLogin, login.senhaLogin);
});

When("acesso a funcionalidade histórico", () => {
    cy.intercept('GET', "api/v1/list", {
        statusCode: 200,
        body: []
    });
    cy.intercept('GET', "api/v1/list/history", {
        statusCode: 200,
        body: lista
    });
    historicoListaDeComprasPage.clicarNoHistorico();
});

Then("visualizo o histórico das últimas 10 listas de compras", () => {
    historicoListaDeComprasPage.exibirHistoricoDeListas();
});

And("visualizo o nome e a data de criação da lista de compra", () => {
    historicoListaDeComprasPage.exibirNomeEDataLista();
});

Then("seleciono uma lista de compras", () => {
    historicoListaDeComprasPage.clicarEmLista();
    cy.intercept('GET', `api/v1/list/history/${lista[0].id}`, {
        statusCode: 200,
        body: responseLista
    });
});

Then("visualizo os itens da lista de compra", () => {
    historicoListaDeComprasPage.exibirItenslista();
});