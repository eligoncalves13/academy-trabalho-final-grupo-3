import { loginUsuarioPage } from "../pages/loginUsuario.po";
import { historicoListaDeComprasPage } from "../pages/historicoListaDeCompras.po";
import lista from "../../fixtures/criarLista.json";
import responseLista from "../../fixtures/responseLista.json";

Given("acessei a página de login do sistema Lembra Compras", () => {
    loginUsuarioPage.acessarLogin();
});

And("informo os dados válidos para efetuar o login", () => {
    cy.cadastrarUsuarioLogin();
    historicoListaDeComprasPage.acessarPaginaInicial();
});

When("acesso a funcionalidade histórico", () => {
    cy.intercept('GET', "api/v1/list/history", {
        statusCode: 200,
        body: lista
    });
    historicoListaDeComprasPage.clicarNoHistorico();
});

And("seleciono uma lista de compras", () => {
    historicoListaDeComprasPage.clicarEmLista();
    cy.intercept('GET', `api/v1/list/history/${lista[0].id}`, {
        statusCode: 200,
        body: responseLista
    });
});

When("acesso a funcionalidade histórico vazio", () => {
    cy.intercept('GET', "api/v1/list/history", {
        statusCode: 200,
        body: []
    });
    historicoListaDeComprasPage.clicarNoHistorico();
});

When("acesso o menu de opções", () => {
    historicoListaDeComprasPage.clicarNoMenuOpcoes();
});

And("seleciono a opção histórico no menu", () => {
    historicoListaDeComprasPage.clicarNaOpcaoHistorico();
    cy.intercept('GET', "api/v1/list/history", {
        statusCode: 200,
        body: lista
    });
});

And("seleciono a opção página inicial", () => {
    historicoListaDeComprasPage.clicarNaOpcaoPaginaInicial();
});

Then("visualizo o histórico das últimas 10 listas de compras", () => {
    historicoListaDeComprasPage.exibirHistoricoDeListas();
});

And("visualizo o nome e a data de criação da lista de compra", () => {
    historicoListaDeComprasPage.exibirNomeEDataLista();
});

Then("visualizo os itens da lista de compra", () => {
    historicoListaDeComprasPage.exibirItenslista();
});

Then("visualizo o histórico vazio", () => {
    historicoListaDeComprasPage.exibirHistoricoVazio();
});

Then("visualizo o histórico de listas", () => {
    historicoListaDeComprasPage.exibirHistoricoDeListas();
});

Then("visualizo a página inicial do sistema", () => {
    loginUsuarioPage.exibePaginaCriarLista();
});