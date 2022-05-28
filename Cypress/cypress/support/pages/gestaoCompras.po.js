/// <reference types="cypress" />

class CriarUsuarios {
    // Atributos da classe são os seletores da nossa tela
    inputNome = "input[name='name']";
    inputEmail = "input[name='email']";
    inputSenha = "input[name='password']";
    inputConfirmarSenha = "input[name='confirmPassword']";
    botaoRegistrar = ".sc-ftvSup";
    botaoLogin = ".sc-ftvSup";
    botaoAdicionar = ".sc-kLLXSd";
    // inputEmailLogin = "input[name='email']";
    // inputSenhaLogin = "input[name='password']";
    inputDescricao = "input[name='description']";
    inputQuantidade = "input[name='amount']";
    
    visitar(){
        cy.visit("https://academy-lembra-compras.herokuapp.com/register");
    };

    visitarLogin(){
        cy.visit("https://academy-lembra-compras.herokuapp.com/login");
    };

    cadastroConjunto(nome,email,senha,confirmar_senha){
        cy.get(this.inputNome).type(nome);
        cy.get(this.inputEmail).type(email);
        cy.get(this.inputSenha).type(senha);
        cy.get(this.inputConfirmarSenha).type(confirmar_senha);
        cy.get(this.botaoRegistrar).click();
    };

    loginConjunto(email,senha){
        cy.get(this.inputEmail).type(email);
        cy.get(this.inputSenha).type(senha);
        cy.contains("button", "Entrar").click();
    };

    listaConjunto(descricao, nome, quantidade){
        cy.get(this.inputDescricao).type(descricao);
        cy.get(this.inputNome).type(nome);
        cy.get(this.inputQuantidade).type(quantidade);
        cy.contains("button", "Salvar").click();
    };
    
    verificarMensagemPositiva(seletor, mensagempositiva){
        cy.contains(seletor, mensagempositiva).should("be.visible");
    };

    exibePaginaCriarLista() {
        cy.contains("h2", "Dê um nome para sua lista").should("be.visible");
    }


}   

export var criarUsuarios = new CriarUsuarios();