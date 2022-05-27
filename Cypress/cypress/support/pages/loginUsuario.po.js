class LoginUsuarioPage {

    inputEmailLogin = "input[name='email']";
    inputSenhaLogin = "input[name='password']";    
    
    gerarEmailAleatorio() {
        const prefixo = crypto.randomUUID();
        return `email-${prefixo}@email.com`;
    }
    
    gerarSenhaAleatorio() {
        return crypto.randomUUID().slice(0, 5);
    }
    
    acessarLogin() {
        cy.visit("/login");
    }
    
    preencherEmailLogin(emailLogin) {       
        cy.get(this.inputEmailLogin).type(emailLogin);
    }
    
    preencherSenhaLogin(senhaLogin) {       
        cy.get(this.inputSenhaLogin).type(senhaLogin);
    }
    
    clicarBotaoEntrar() {
        cy.contains("button", "Entrar").click();
    }
    
    preencherLogin() {      
        this.preencherEmailLogin(this.gerarEmailAleatorio());
        this.preencherSenhaLogin(this.gerarSenhaAleatorio());
        this.clicarBotaoEntrar();
    }       
    
    preencherLoginComDadosInvalidos(emailLogin, senhaLogin) {       
        this.preencherEmailLogin(emailLogin);
        this.preencherSenhaLogin(senhaLogin);
        this.clicarBotaoEntrar();
    }   
 
    exibePaginaCriarLista() {
        cy.contains("h2", "Dê um nome para sua lista").should("be.visible");
    }
    
    clicarEmRegistreSe() {
        cy.contains(".cvtYsR", "Registre-se").click();
    }
    
    exibeFormularioParaCadastrarNovoUsuario() {
        cy.get("a[href='/login']").should("be.visible");
    }
    
    exibirMensagemErroEmailOuSenhaIncorretos() {
        cy.contains(".davdmO", "E-mail ou senha incorretos.").should("be.visible");
        cy.contains(".go3958317564", "E-mail ou senha incorretos.").should("be.visible");
    }
    
    exibirMensagemErroLogin(mensagemErroLogin) {
        this.clicarBotaoEntrar();
        cy.contains(".davdmO", mensagemErroLogin).should("be.visible");
    }
}
export var loginUsuarioPage = new LoginUsuarioPage();