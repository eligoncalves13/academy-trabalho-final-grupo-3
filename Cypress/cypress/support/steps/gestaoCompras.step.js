/// <reference types="cypress" />

import { criarUsuarios } from "../pages/gestaoCompras.po" 

Given("acessei a tela de cadastro", () => {
    criarUsuarios.visitar();
});

Given("acessei a tela de login", () => {
    criarUsuarios.visitarLogin();
});

When("preencho o formulário e salvo", (tabela) =>{
    var dadosTabela = tabela.rowsHash();
    criarUsuarios.cadastroConjunto(dadosTabela.nome,dadosTabela.email, dadosTabela.senha,dadosTabela.confirmar_senha)
});

When("preencho os dados de Login", (tabela) =>{
    var dadosTabela = tabela.rowsHash();
    criarUsuarios.loginConjunto(dadosTabela.email, dadosTabela.senha)
});
When("informo os campos de criação da lista", (tabela) =>{
    var dadosTabela = tabela.rowsHash();
    criarUsuarios.listaConjunto(dadosTabela.descricao, dadosTabela.nome,dadosTabela.quantidade)
});

Then("visualizo a mensagem positiva {string}", (mensagempositiva) => {
    cy.contains(mensagempositiva).should("be.visible");    
});

Then("visualizo as demais funcionalidades do sistema", () => {
    criarUsuarios.exibePaginaCriarLista();
});