class GestaoCompras {
    // Atributos da classe são os seletores da nossa tela
    // inputNome = "input[name='name']";
    // inputEmail = "input[name='email']";
    // inputSenha = "input[name='password']";
    // inputConfirmarSenha = "input[name='confirmPassword']";
    // botaoRegistrar = ".sc-ftvSup";
    // botaoLogin = ".sc-ftvSup";
    botaoAdicionar = ".sc-kLLXSd";
    // inputEmailLogin = "input[name='email']";
    // inputSenhaLogin = "input[name='password']";
    inputDescricao = "input[name='description']";
    inputQuantidade = "input[name='amount']";
    mensagemNeg = '.sc-papXJ'
    
    visitar(){
        cy.visit("/lista");
    };


    // visitarLogin(){
    //     cy.visit("/register/login");
    // };


    // cadastroConjunto(nome,email,senha,confirmar_senha){
    //     cy.get(this.inputNome).type(nome);
    //     cy.get(this.inputEmail).type(email);
    //     cy.get(this.inputSenha).type(senha);
    //     cy.get(this.inputConfirmarSenha).type(confirmar_senha);
    //     cy.get(this.botaoRegistrar).click();
    // };

    // loginConjunto(email,senha){
    //     cy.get(this.inputEmail).type(email);
    //     cy.get(this.inputSenha).type(senha);
    //     cy.contains("button", "Entrar").click();
    // };

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
    
    verificarMensagemPositiva(seletor, mensagempositiva){
        cy.contains(seletor, mensagempositiva).should("be.visible");
    };

    // essas duas dá pra substituir por uma só 
    
    verificarMensagemNegativa(mensagemnegativa){
        cy.contains(mensagemnegativa).should("be.visible");
    };

    verificarMensagemErro(mensagemErro){
        mensagemErro.forEach((mensagem, index) => {
            cy.get(".sc-papXJ").eq(index).contains(mensagem).should("be.visible");
        });    
    }; 
    
    exibePaginaCriarLista() {
        cy.contains("h2", "Dê um nome para sua lista").should("be.visible");
    }

}   

export var gestaoCompras = new GestaoCompras();