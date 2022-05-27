import { loginUsuarioPage } from "../pages/loginUsuario.po";
import { historicoListaDeComprasPage } from "../pages/historicoListaDeCompras.po";
import loginResposta from "../../fixtures/token.json";
import lista from "../../fixtures/criarLista.json";
import { expect } from "chai";

Given("acessei o sistema Lembra Compras", () => {
    loginUsuarioPage.acessarLogin();
});
And("informo os dados válidos para efetuar o login", () => {
    cy.intercept('POST', "api/v1/auth/login", {
        statusCode: 200,
        body: loginResposta
    });
    loginUsuarioPage.preencherLogin();
});
When("seleciono a funcionalidade histórico", () => {
    cy.intercept('GET', "api/v1/list", {
        statusCode: 200,
        body: []
    });
    historicoListaDeComprasPage.clicarNoHistorico();
});
Then("visualizo o histórico das últimas 10 listas de compras", () => {
    cy.intercept('GET', "api/v1/list/history", {
        statusCode: 200,
        body: lista
    });
    historicoListaDeComprasPage.exibeHistoricoDeListas();
    expect(lista).length(10);
});



And("visualizo o nome e a data de criação da lista de compra", () => {
    // cy.intercept('GET', "api/v1/list/history", {
    //     statusCode: 200,
    //     body: lista
    // });
    historicoListaDeComprasPage.exibeNomeEDataLista();
});