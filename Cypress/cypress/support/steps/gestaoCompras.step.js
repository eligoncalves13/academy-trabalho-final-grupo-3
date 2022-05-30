import { gestaoCompras } from "../pages/gestaoCompras.po";

Given("acessei o sistema Lembra Compras", () => {
    gestaoCompras.visitar();
});

When("informo os campos de criação da lista", (tabela) =>{
    var dadosTabela = tabela.rowsHash();
    gestaoCompras.listaConjunto(dadosTabela.descricao, dadosTabela.nome,dadosTabela.quantidade)
});

When("informo, sem a descricao, os campos de criação da lista", (tabela) =>{
    var dadosTabela = tabela.rowsHash();
    gestaoCompras.listaConjuntoSemDescricao(dadosTabela.descricao, dadosTabela.nome,dadosTabela.quantidade)
});

When("informo os dados do usuário para cadastrar", (tabela) => {
    const dadosTabela = tabela.rowsHash();
    gestaoCompras.listaConjuntoSemDescricao(dadosTabela.descricao, dadosTabela.nome,dadosTabela.quantidade);
});

When("informo o nome do item com formato inválido", (tabela) =>{
    var dadosTabela = tabela.rowsHash();
    gestaoCompras.listaNome(dadosTabela.descricao, dadosTabela.nome,dadosTabela.quantidade)
});

When("informo os campos de criação da lista, o primeiro item possui 1 unidade", (tabela) =>{
    var dadosTabela = tabela.rowsHash();
    gestaoCompras.listaNome(dadosTabela.descricao, dadosTabela.nome,dadosTabela.quantidade)
});

When("informo os campos de criação da lista, o primeiro item possui mais de 1 unidade", (tabela) =>{
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

When("informo os campos de criação da lista, o primeiro item possui 1 unidade", (tabela) =>{
    var dadosTabela = tabela.rowsHash();
    gestaoCompras.listaNomeQuantidade(dadosTabela.descricao, dadosTabela.nome,dadosTabela.quantidade)
});

Then("visualizo a mensagem positiva {string}", (mensagempositiva) => {
    cy.contains(mensagempositiva).should("be.visible");
    // gestaoCompras.detelarUsuario();   
});

Then("visualizo a mensagem negativa {string}", (mensagemnegativa) => {
    cy.contains(mensagemnegativa).should("be.visible");
    // gestaoCompras.detelarUsuario();    
});

Then("visualizo a mensagem de erros {string}", (mensagemErro) => {
    gestaoCompras.verificarMensagemErro([mensagemErro]);
    // gestaoCompras.detelarUsuario();    
});

// Then("visualizo a soma dos itens {string}", (mensagemErro) => {
//     gestaoCompras.verificarMensagemErro([mensagemErro]);
//     // gestaoCompras.detelarUsuario();    
// });

Then("visualizo a soma dos itens", () => {
    cy.get('span').contains('4x - Maça') ;
    // cy.get('p').contains('4x - Maça');
});




// And("visualizo a mensagem positiva {string}", (mensagempositiva) => {
//     cy.contains(mensagempositiva).should("be.visible");    
// });