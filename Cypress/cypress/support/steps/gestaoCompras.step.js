import { gestaoCompras } from "../pages/gestaoCompras.po";
import { faker } from '@faker-js/faker';
import { loginUsuarioPage } from "../pages/loginUsuario.po.js"; 

const login = {
    emailLogin: faker.internet.email().toLowerCase(),
    senhaLogin: faker.internet.password()
}

// Given("acessei a tela de cadastro", () => {
//     criarUsuarios.visitar();
// });

// Given("acessei a tela de login", () => {
//     criarUsuarios.visitarLogin();
// });

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

When("preencho o formulário e salvo", (tabela) =>{
    var dadosTabela = tabela.rowsHash();
    gestaoCompras.cadastroConjunto(dadosTabela.nome,dadosTabela.email, dadosTabela.senha,dadosTabela.confirmar_senha)
});

When("preencho os dados de Login", (tabela) =>{
    var dadosTabela = tabela.rowsHash();
    gestaoCompras.loginConjunto(dadosTabela.email, dadosTabela.senha)
});

When("informo os campos de criação da lista", (tabela) =>{
    var dadosTabela = tabela.rowsHash();
    gestaoCompras.listaConjunto(dadosTabela.descricao, dadosTabela.nome,dadosTabela.quantidade)
});

When("informo o nome do item com formato inválido", (tabela) =>{
    var dadosTabela = tabela.rowsHash();
    gestaoCompras.listaNome(dadosTabela.descricao, dadosTabela.nome,dadosTabela.quantidade)
});

// When("informo, sem a descricao, os campos de criação da lista", (tabela) =>{
//     var dadosTabela = tabela.rowsHash();
//     gestaoCompras.listaConjunto(dadosTabela.descricao, dadosTabela.nome,dadosTabela.quantidade)
// });

// When("informo, com quantidade zerada, os campos de criação da lista", (tabela) =>{
//     var dadosTabela = tabela.rowsHash();
//     gestaoCompras.listaQuantidade(dadosTabela.descricao, dadosTabela.nome,dadosTabela.quantidade)
// });

When("informo, desrespeitando os limites de quantidade, os campos de criação da lista", (tabela) =>{
    var dadosTabela = tabela.rowsHash();
    gestaoCompras.listaQuantidade(dadosTabela.descricao, dadosTabela.nome,dadosTabela.quantidade)
});

When("informo o nome do item com número", (tabela) =>{
    var dadosTabela = tabela.rowsHash();
    gestaoCompras.listaConjunto(dadosTabela.descricao, dadosTabela.nome,dadosTabela.quantidade)
});

Then("visualizo a mensagem positiva {string}", (mensagempositiva) => {
    cy.contains(mensagempositiva).should("be.visible");    
});

Then("visualizo a mensagem negativa {string}", (mensagemnegativa) => {
    cy.contains(mensagemnegativa).should("be.visible");    
});

Then("visualizo a mensagem de erro {string}", (mensagemErro) => {
    gestaoCompras.verificarMensagemErro([mensagemErro]);    
});

Then("visualizo as demais funcionalidades do sistema", () => {
    gestaoCompras.exibePaginaCriarLista();
});

// And("visualizo a mensagem positiva {string}", (mensagempositiva) => {
//     cy.contains(mensagempositiva).should("be.visible");    
// });