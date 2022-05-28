class CadastroPage{
    inputNome = "input[name='name']";
    inputEmail = "input[name='email']";
    inputSenha = "input[name='password']";
    inputConfirmarSenha = "input[name='confirmPassword']";
    svgSenha = "svg[stroke='currentColor']"

    visitar() {
        cy.visit("");
    };

    clicarEmRegistrarSe() {
        cy.get("a[href='/register']").click();
    };

    clicarEmRegistrar() {
        cy.contains("button", "Registrar").click();
    };

    clicarEmVoltarAoLogin() {
        cy.get("a[href='/login']").click();
    };

    clicarMostrarSenha(){
        cy.get(this.svgSenha).eq(0).click();
    };

    clicarMostrarConfirmarSenha(){
        cy.get(this.svgSenha).eq(1).click();
    };

    preencherNome(nome) {
        cy.get(this.inputNome).type(nome);
    };

    preencherEmail(email) {
        cy.get(this.inputEmail).type(email);
    };

    preencherSenha(senha) {
        cy.get(this.inputSenha).type(senha);
    };

    preencherConfirmarSenha(confirmarSenha) {
        cy.get(this.inputConfirmarSenha).type(confirmarSenha);
    };

    preencherFormulario(nome, email,senha, confirmarSenha){
        if(nome != ""){
            this.preencherNome(nome);
        }
        if(email != ""){
            this.preencherEmail(email);
        }
        if(senha != ""){
            this.preencherSenha(senha);
        }
        if(confirmarSenha != ""){
            this.preencherConfirmarSenha(confirmarSenha);
        }
    };

    verficiarAcessoPaginaCadastro(){
        cy.url().should("equal", "https://academy-lembra-compras.herokuapp.com/register");
    };

    verficiarAcessoPaginaLogin(){
        cy.url().should("equal", "https://academy-lembra-compras.herokuapp.com/login");
    };

    verificarMensagemSucesso(mensagemSucesso){
        cy.contains(".go3958317564", mensagemSucesso).should("be.visible");
    };
    
    verificarMensagemErro(mensagemErro){
        cy.contains(".sc-papXJ", mensagemErro).should("be.visible");
    }; 

    verificarMensagemEmailExistente(mensagemErro){
        cy.contains(".go3958317564", mensagemErro).should("be.visible");
    }; 

    verificarSenhaEmFormatoTexto(){
        cy.get(this.inputSenha).invoke('attr', 'type').should('include', 'text');
    }; 

    verificarConfirmarSenhaEmFormatoTexto(){
        cy.get(this.inputConfirmarSenha).invoke('attr', 'type').should('include', 'text');
    }; 
}

export var cadastroPage = new CadastroPage();