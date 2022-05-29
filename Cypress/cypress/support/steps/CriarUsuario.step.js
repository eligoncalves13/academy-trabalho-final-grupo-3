import { cadastroPage } from "../pages/criarUsuario.po"

Given("acessei o sistema Lembra Compras", () => {
    cadastroPage.visitar();
});

Given("acessei a tela de cadastro", () => {
    cadastroPage.clicarEmRegistrarSe();
    cadastroPage.verificarAcessoPaginaCadastro();
});

When("informo os dados válidos do usuário para cadastrar", (tabela) => {
    cy.intercept("POST", "https://lista-compras-api.herokuapp.com/api/v1/users", {
        statusCode: 201
    });
    const dadosTabela = tabela.rowsHash();
    cadastroPage.preencherFormulario(dadosTabela.nome, dadosTabela.email, dadosTabela.senha, dadosTabela.confirmar_senha);
    cadastroPage.clicarEmRegistrar();
});

When("informo os dados do usuário para cadastrar", (tabela) => {
    const dadosTabela = tabela.rowsHash();
    cadastroPage.preencherFormulario(dadosTabela.nome, dadosTabela.email, dadosTabela.senha, dadosTabela.confirmar_senha);
    cadastroPage.clicarEmRegistrar();
});

When("informo os dados do usuário com email já existente para cadastrar", (tabela) => {
    cy.intercept("POST", "https://crud-api-academy.herokuapp.com/api/v1/users", {
        statusCode: 422
    });
    const dadosTabela = tabela.rowsHash();
    cadastroPage.preencherFormulario(dadosTabela.nome, dadosTabela.email, dadosTabela.senha, dadosTabela.confirmar_senha);
    cadastroPage.clicarEmRegistrar();
});

When("seleciono para voltar à página de login", () => {
    cadastroPage.clicarEmVoltarAoLogin();
});

When("informo a senha do usuário para cadastrar", (tabela) => {
    const dadosTabela = tabela.rowsHash();
    cadastroPage.preencherSenha(dadosTabela.senha);
});

When("informo a confirmação de senha do usuário para cadastrar", (tabela) => {
    const dadosTabela = tabela.rowsHash();
    cadastroPage.preencherConfirmarSenha(dadosTabela.confirmar_senha);
});

And("seleciono para mostrar senha", () => {
    cadastroPage.clicarMostrarSenha();
 });

 And("seleciono para mostrar senha de confirmação", () => {
    cadastroPage.clicarMostrarConfirmarSenha();
 });

Then("visualizo a mensagem de sucesso {string}", (mensagemSucesso) => {
    cadastroPage.verificarMensagemSucesso(mensagemSucesso);
});

Then("visualizo a mensagem de erro {string}", (mensagemErro) => {
    if(mensagemErro.includes(";")){
        cadastroPage.verificarMensagemErro(mensagemErro.split(';'));
    }else{
        cadastroPage.verificarMensagemErro([mensagemErro]);
    };
});

Then("visualizo a mensagem de email existente {string}", (mensagemErro) => {
    cadastroPage.verificarMensagemEmailExistente(mensagemErro);
});

Then("visualizo a tela de login", () => {
    cadastroPage.verificarAcessoPaginaLogin();
});

Then("visualizo a senha em formato de texto", () => {
    cadastroPage.verificarSenhaEmFormatoTexto();
});

Then("visualizo a confirmação de senha em formato de texto", () => {
    cadastroPage.verificarConfirmarSenhaEmFormatoTexto();
});