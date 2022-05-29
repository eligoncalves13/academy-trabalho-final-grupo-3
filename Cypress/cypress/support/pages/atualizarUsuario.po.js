class AtualizarUsuarioPage {
    inputName = "input[name='name']";
    inputEmail = "input[name='email']";
    inputSenha = "input[name='password']";
    inputConfirmarSenha = "input[name='confirmPassword']";
    inputNameEditar = "input[text='name']";
    

    acessarLogin() {
        cy.visit("/logout");
        cy.visit("/login");
    }

    clicarBotaoRegistrase() {
        cy.get(".sc-crXcEl.cvtYsR").click()
    }

    preencherNome(nome) {
        cy.wait(1000)
        cy.get(this.inputName).clear().type(nome)
    }

    preencherEmail(email) {       
        cy.get(this.inputEmail).clear().type(email);
    }

    preencherSenha(senha) {       
        cy.get(this.inputSenha).type(senha);
    }

    preencherConfSenhaCriar(senha) {
        cy.get(this.inputConfirmarSenha).type(senha);
    }
    
    clicarEmRegistrar() {
        cy.contains("button", "Registrar").click()
        cy.wait(1000)
    }

    criarUsuario(nome, email, senha){
        cy.get(this.inputName).type(nome);
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

    clicarBotaoConfirmarAlteracoes() {
        cy.contains("button", "Confirmar alterações").click()
    }

    clicarBotaoConfirma() {
        cy.get("div[class='sc-jdAMXn iMjKmA']>button").click()
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

    detelarUsuario() {
        cy.window().then(window=> {
            const sessionData = window.sessionStorage.getItem('sessionData')
            const token = JSON.parse(sessionData).session.token

            cy.wrap(token).should('exist')

            cy.request({
                url: 'https://lista-compras-api.herokuapp.com/api/v1/cancel-account',
                method: "delete",
                headers: {
                    "X-JWT-Token": token
                }
              }).then((resp) => {
                expect(resp.status).to.eq(204)
              })
          }); 
    }

    validarMensagemSucessoCadastro() {
        cy.contains(".go3958317564", "Informações atualizadas com sucesso!").should("be.visible");
    }

    nomeCemCaracteres() {
        cy.get(this.inputName).clear().type( "Barnaby Marmaduke Aloysius Benjy Cobweb Dartagnan Egbert Felix Gaspar Humbert Ignatius Jayden Kasper Leroy Reinalts")
    }

    validarMensagemCaracteresMaximo() {
        cy.contains("span", "Informe no").should("be.visible");
    }

    validarMensagemInfomeNome() {
        cy.contains("span", "Informe seu nome").should("be.visible");
    }

    ValidarMensagemNomeInvalido() {
        cy.contains("span", "Formato do nome é inválido").should("be.visible");
    }
    
    emailGrande() {
        cy.get(this.inputEmail).clear().type(email)
    }
    
    validarMensagemSessentaCarac() {
        cy.contains("span", "Informe no máximo 60 caracteres.").should("be.visible");
    }

    apagarEmail() {
        cy.get(this.inputEmail).clear();
    }

    validarMensagemInfomeEmail() {
        cy.contains("span", "Informe seu e-mail").should("be.visible");
    }

    ValidarMensagemEmailInvalido() {
        cy.contains("span", "Formato de e-mail inválido.").should("be.visible");
    }

    validarHistorico() {
        cy.get("a[href='/historico']").click();
    }

    headerHistorico() {
        cy.contains("h2", "Histórico").should("be.visible");
    }

    ValidarLista() {
        cy.get("a[href='/lista']").click();
    }

    headerLista() {
        cy.contains("h2", "Dê um nome para sua lista").should("be.visible");
    }

    clicarEmSair() {
        cy.get("a[href='/logout']").click();
    }

    telaLogin() {
        cy.contains(" h1", "Entre e saiba mais").should("be.visible");
    }
}


export var atualizarUsuarioPage = new AtualizarUsuarioPage();