class LoginUsuarioPage {
    inputEmailLogin = "input[name='email']";
    inputSenhaLogin = "input[name='password']";

    acessarLogin() {
        cy.visit("/logout");
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

    preencherLogin(emailLogin, senhaLogin) {
        this.preencherEmailLogin(emailLogin);
        this.preencherSenhaLogin(senhaLogin);
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
    
    exibirMensagensErroLogin(mensagensErroLogin) {
        this.clicarBotaoEntrar();
        mensagensErroLogin.forEach(mensagemErro => {
            cy.contains(".davdmO", mensagemErro).should("be.visible");
        });
    }
}
export var loginUsuarioPage = new LoginUsuarioPage();