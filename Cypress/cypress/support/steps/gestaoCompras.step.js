import { gestaoCompras } from "../pages/gestaoCompras.po";

Given("acessei o sistema Lembra Compras", () => {
    gestaoCompras.visitar();
});

When("informo os campos de criação da lista", (tabela) =>{
    const dadosTabela = tabela.rowsHash();
    gestaoCompras.listaConjunto(dadosTabela.descricao, dadosTabela.nome,dadosTabela.quantidade)
});

When("informo, sem a descricao, os campos de criação da lista", (tabela) =>{
    const dadosTabela = tabela.rowsHash();
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
    gestaoCompras.verificarMensagemPositiva(mensagempositiva);
});

Then("visualizo a mensagem negativa {string}", (mensagemnegativa) => {
    gestaoCompras.verificarMensagemNegativa(mensagemnegativa);
});

Then("visualizo a mensagem de erros {string}", (mensagemErro) => {
    gestaoCompras.verificarMensagemErro([mensagemErro]);
});

Then("visualizo {string} na soma dos itens", (resultado) => {
    gestaoCompras.verificarSoma(resultado);
});

When("informo os campos de criação da lista, acrescentando um item", (tabela) =>{
    const dadosTabela = tabela.rowsHash();
    gestaoCompras.preencherListaComUmItem(dadosTabela.descricao, dadosTabela.nome,dadosTabela.quantidade)
});

And("acrescento um item com nome já presente", (tabela) =>{
    const dadosTabela = tabela.rowsHash();
    gestaoCompras.adicionarUmItem(dadosTabela.nome, dadosTabela.quantidade)
});

And("salvo a lista", () =>{
    gestaoCompras.salvarLista();
});

And("marco o item como concluído", () =>{
    gestaoCompras.clicarConcluirItem();
});

And("seleciono para finalizar a lista", () =>{
    gestaoCompras.finalizarLista();
});

And("confirmo a finalização da lista", () =>{
    gestaoCompras.confirmarFinalizarLista();
});

And("atualizo a página", () =>{
    cy.reload();
});

And("seleciono para fechar a modal", () =>{
    gestaoCompras.fecharModalFinalizarLista();
});

Then("o item é riscado da lista", () =>{
    gestaoCompras.verificarItemRiscado();
});

Then("o item deve permanecer riscado", () => {
    gestaoCompras.verificarItemRiscado();
});

Then("a modal é fechada sem finalizar a lista", () => {
    gestaoCompras.verificarInexistenciaModal();
    gestaoCompras.verificarListaCriada();
})