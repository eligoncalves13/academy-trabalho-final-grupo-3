class GestaoCompras {
    // Atributos da classe são os seletores da nossa tela
    inputNome = "input[name='name']";
    botaoAdicionar = ".sc-kLLXSd";
    inputDescricao = "input[name='description']";
    inputQuantidade = "input[name='amount']";
    mensagemNeg = '.sc-papXJ'

    visitar(){
        cy.visit("/lista");
    };

    listaConjunto(descricao, nome, quantidade){
        cy.get(this.inputDescricao).type(descricao);
        cy.get(this.inputNome).type(nome);
        cy.get(this.inputQuantidade).type(quantidade);
        cy.get(this.botaoAdicionar).click();
        cy.contains("button", "Salvar").click();        
        cy.contains("button", "Finalizar a lista").click();
        cy.contains("button", "Confirmar").click();
    };

    listaNome(descricao, nome, quantidade){
        cy.get(this.inputDescricao).clear()
        cy.get(this.inputDescricao).type(descricao);
        cy.get(this.inputNome).clear()
        cy.get(this.inputNome).type(nome);
        cy.get(this.inputQuantidade).clear();
        cy.get(this.inputQuantidade).type(quantidade);
        cy.get(this.botaoAdicionar).click();
    };
    
    listaQuantidade(descricao, nome, quantidade){
        cy.get(this.inputDescricao).type(descricao);
        cy.get(this.inputNome).type(nome);
        cy.get(this.inputQuantidade).clear();
        cy.get(this.inputQuantidade).type(quantidade);
        cy.get(this.botaoAdicionar).click();
    };

    listaNomeQuantidade(descricao, nome, quantidade){
        cy.get(this.inputDescricao).type(descricao);
        cy.get(this.inputNome).type(nome);
        cy.get(this.inputQuantidade).type(quantidade);
        cy.get(this.botaoAdicionar).click();
        cy.get(this.inputNome).type(nome);
        cy.get(this.inputQuantidade).type(quantidade);
        cy.get(this.botaoAdicionar).click();        
        cy.contains("button", "Salvar").click();
        cy.wait(4000);        
    };

    listaConjuntoSemDescricao(descricao, nome, quantidade){
        if(descricao != ""){
            cy.get(this.inputDescricao).type(descricao);
        }
        if(nome != ""){
            cy.get(this.inputNome).type(nome);
        }
        if(quantidade != ""){
            cy.get(this.inputQuantidade).type(quantidade);
        }
        cy.get(this.botaoAdicionar).click();
        cy.contains("button", "Salvar").click();        
        cy.contains("button", "Finalizar a lista").click();
        cy.contains("button", "Confirmar").click();
    };

    preencherListaComUmItem(descricao, nome, quantidade){
        cy.get(this.inputDescricao).type(descricao);
        cy.get(this.inputNome).type(nome);
        cy.get(this.inputQuantidade).clear().type(quantidade);
        cy.get(this.botaoAdicionar).click();
    };

    adicionarUmItem(nome, quantidade){
        cy.get(this.inputNome).type(nome);
        cy.get(this.inputQuantidade).clear().type(quantidade);
        cy.contains("button", "+").click();
    };

    salvarLista(){
        cy.contains("button", "Salvar").click();
        cy.wait(2000);
    };

    clicarConcluirItem(){
        cy.get(".sc-himrzO").click();
    };

    verificarItemRiscado(){
        cy.get(".sc-gXmSlM").should('have.css', 'text-decoration-line', 'line-through');
    };

    finalizarLista(){
        cy.contains("button", "Finalizar a lista").click();
    };

    confirmarFinalizarLista(){
        cy.contains("button", "Confirmar").click();
    };

    fecharModalFinalizarLista(){
        cy.contains("button", "x").click();
    };

    verificarInexistenciaModal(){
        cy.get(".sc-ciZhAO").should("not.exist");
    };

    verificarListaCriada(){
        cy.get(".sc-iTONeN").should("be.visible");
    };

    verificarMensagemPositiva(seletor, mensagempositiva){
        cy.contains(seletor, mensagempositiva).should("be.visible");
    };
    
    verificarMensagemNegativa(mensagemnegativa){
        cy.contains(mensagemnegativa).should("be.visible");
    };

    verificarMensagemErro(mensagemErro){
        mensagemErro.forEach((mensagem, index) => {
            cy.get(".sc-papXJ").eq(index).contains(mensagem).should("be.visible");
        });    
    };

    verificarSomaouConcatenacao() {
        cy.get('p').contains('4x - Maça');
        // cy.contains("span", "4").should("be.visible");
        // cy.contains("span", "4x - Maça").should("be.visible");
    }
    
    exibePaginaCriarLista() {
        cy.contains("h2", "Dê um nome para sua lista").should("be.visible");
    }
}

export var gestaoCompras = new GestaoCompras();