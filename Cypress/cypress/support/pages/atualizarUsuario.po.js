class AtualizarUsuarioPage {
    inputNameCriar = "input[name='name']";
    inputEmail = "input[name='email']";
    inputSenha = "input[name='password']";
    inputConfirmarSenha = "input[name='confirmPassword']";
    inputNameEditar = "input[text='name']";
    

    acessarLogin() {
        cy.visit("/login");
    }

    clicarBotaoRegistrase() {
        cy.get(".sc-crXcEl.cvtYsR").click()
    }

    preencherNomeCriar(nome) {
        cy.get(this.inputNameCriar).type(nome)
    }

    preencherEmail(email) {       
        cy.get(this.inputEmail).type(email);
    }

    preencherSenha(senha) {       
        cy.get(this.inputSenha).type(senha);
    }

    preencherConfSenhaCriar(senha) {
        cy.get(this.inputConfirmarSenha).type(senha);
    }
    
    clicarEmRegistrar() {
        cy.contains("button", "Registrar").click()
        cy.wait(2000)
    }

    criarUsuario(nome, email, senha){
        cy.get(this.inputNameCriar).type(nome);
        cy.get(this.inputEmail).type(email);
        cy.get(this.inputSenha).type(senha);
        cy.get(this.inputConfirmarSenha).type(senha);
        }
        
    clicarBotaoEntrar() {
        cy.contains("button", "Entrar").click();
    }

    preencherLogin(email,senha ) {  
        if(email != ""){
            this.preencherEmail(email);
        }
        if(senha != ""){
            this.preencherSenha(senha);
        }
        this.clicarBotaoEntrar();
    }    
     
    clicarOpcoes() {
        cy.get(".sc-bjUoiL.bgBaRw").click();
    }
    
    clicarPerfil() {
        cy.get("a[href='/perfil']").click();
    }

    apagarNome() {
        cy.get(this.inputName).clear();
    }

    preencherNomeCompleto(nome) {
        cy.get(this.inputName).type(nome);
    }

    preencherEmail(email) {
        cy.get(this.inputEmail).type(email);
    }

    clicarBotaoConfirmarAlteracoes() {
        cy.contains("button", "Confirmar alterações").click()
    }

    clicarBotaoConfirma() {
        cy.contains("button", "Confirmar").click()
    }

    atualizarNomeUsuario(tabela){
        var dado = tabela.rowsHash();
        this.preencherNomeCompleto(dado.nome);
        this.clicarBotaoConfirmarAlteracoes();
    }

    gerarEmailAleatorio() {
        const prefixo = crypto.randomUUID();
        return `email-${prefixo}@email.com`;
    }
}

export var atualizarUsuarioPage = new AtualizarUsuarioPage();