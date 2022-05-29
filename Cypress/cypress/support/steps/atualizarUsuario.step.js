import { atualizarUsuarioPage } from "../pages/atualizarUsuario.po";
import { faker } from '@faker-js/faker'

const user = { 
    name: faker.name.firstName() + ' ' + faker.name.middleName(),
    email: faker.internet.email().toLowerCase(),
    password: faker.internet.password()
}

//Background
Given("acessei o sistema Lembra Compras", () => {
    atualizarUsuarioPage.acessarLogin();
});

When("informo os dados válidos do usuário para cadastrar e logar no sistema", () => {
    atualizarUsuarioPage.clicarBotaoRegistrase();
    atualizarUsuarioPage.criarUsuario(user.name, user.email, user.password, user.password);
    atualizarUsuarioPage.clicarEmRegistrar();
    cy.wait(1000)
    atualizarUsuarioPage.preencherLogin(user.email, user.password);
});

Then("visualizo o perfil no menu de opções", () => {
    atualizarUsuarioPage.clicarOpcoes();
    atualizarUsuarioPage.clicarPerfil();
    cy.wait(1000);
})

//Atualizar nome do usuário com sucesso
When("informo o nome válido para editar o perfil", () => {
    
    atualizarUsuarioPage.preencherNome(faker.name.firstName() + ' ' + faker.name.lastName());
    atualizarUsuarioPage.clicarBotaoConfirmarAlteracoes();
    atualizarUsuarioPage.clicarBotaoConfirma();
})

Then('visualizo a mensagem de sucesso "Informações atualizadas com sucesso!"', () => {
    atualizarUsuarioPage.validarMensagemSucessoCadastro();
    atualizarUsuarioPage.detelarUsuario();
})

//Atualizar nome com mais de 100 caracteres
When("informo o nome com mais de 100 caracteres", () => {
    atualizarUsuarioPage.nomeCemCaracteres();
    
})

Then('visualizo a mensagem de erro "Informe no máximo 100 letras no seu nome"', () => {
    atualizarUsuarioPage.clicarBotaoConfirmarAlteracoes();
    atualizarUsuarioPage.validarMensagemCaracteresMaximo();
    atualizarUsuarioPage.detelarUsuario();
})

//Atualizar usuário com o campo nome vazio
When("não informo nome do usuário", () => {
    atualizarUsuarioPage.apagarNome();
})    

Then('visualizo a mensagem de erro "Informe seu nome"', () => {
    atualizarUsuarioPage.clicarBotaoConfirmarAlteracoes();
    atualizarUsuarioPage.validarMensagemInfomeNome();
    atualizarUsuarioPage.detelarUsuario();
})

//Atualizar nome do usuário com caracteres especiais
When("informo o nome do usuário", (tabela) => {
    atualizarUsuarioPage.apagarNome();
    var dado = tabela.rowsHash();
    atualizarUsuarioPage.preencherNome(dado.nome)
})

Then('visualizo a mensagem de erro "Formato do nome é inválido."', () => {
    atualizarUsuarioPage.clicarBotaoConfirmarAlteracoes();
    atualizarUsuarioPage.ValidarMensagemNomeInvalido();
    atualizarUsuarioPage.detelarUsuario();
})

//Atualizar email do usuário com sucesso
When("informo o email válido para editar o perfil", () => {
    atualizarUsuarioPage.preencherEmail(faker.internet.email());
    atualizarUsuarioPage.clicarBotaoConfirmarAlteracoes();
    atualizarUsuarioPage.clicarBotaoConfirma();
})

Then('visualizo a mensagem de sucesso "Informações atualizadas com sucesso!"', () => {
    atualizarUsuarioPage.validarMensagemSucessoCadastro();
    atualizarUsuarioPage.detelarUsuario();
})

//Atualizar usuário com email já cadastrado
When("Informo e-mail já utilizado por outro usuário", () => {
    const outroUsuario = { 
        name: faker.name.firstName() + ' ' + faker.name.middleName(),
        email: faker.internet.email().toLowerCase(),
        password: faker.internet.password()
    }
    
    cy.request({
        url: 'https://lista-compras-api.herokuapp.com/api/v1/users',
        method: "post",
        body: outroUsuario
    }).then((resp) => {
        expect(resp.status).to.eq(201)
    })
    cy.wait(2000)
    atualizarUsuarioPage.preencherEmail(outroUsuario.email);
    atualizarUsuarioPage.clicarBotaoConfirmarAlteracoes();
    atualizarUsuarioPage.clicarBotaoConfirma();
    
})

// Atualizar usuário com mais de 60 caracteres
When("informo o email com os dados inválidos", () => {
    const email =  Date.now() + "sdnbfasdasdasdasdasdasdadasdasdbfasdbfasdf@f.com"
    atualizarUsuarioPage.preencherEmail(email);
})

Then('visualizo a mensagem de erro "Informe no máximo 60 caracteres."', () => {
    atualizarUsuarioPage.clicarBotaoConfirmarAlteracoes();
    atualizarUsuarioPage.clicarBotaoConfirma();
    atualizarUsuarioPage.validarMensagemCaracteresMaximo();
    atualizarUsuarioPage.detelarUsuario();
})

// Não aparece a mensagem no campo email "informe no máximo 60 caracteres"
When("informo o email com 101 caracteres", () => {
    const email =  Date.now() + "sdnbfasdasaaaaaaaaaaaaadasaaaaaaasdaaaaaaaadaaaaadadadasdasdasdadasdasdbfasdbfasdf@f.com"
    atualizarUsuarioPage.preencherEmail(email);
})

Then('visualizo a mensagem de erro no campo email "Informe no máximo 60 caracteres."', () => {
    atualizarUsuarioPage.clicarBotaoConfirmarAlteracoes();
    atualizarUsuarioPage.validarMensagemSessentaCarac();
    atualizarUsuarioPage.detelarUsuario();
})
    
// Atualizar usuário com o campo email vazio
When("não informo email do usuário", () => {
    atualizarUsuarioPage.apagarEmail();
})

Then('visualizo a mensagem de erro "Informe seu e-mail"', () => {
    atualizarUsuarioPage.clicarBotaoConfirmarAlteracoes();
    atualizarUsuarioPage.validarMensagemInfomeEmail();
})

// Atualizar usuário com email inválido
When("informo o email do usuário", (tabela) => {
    atualizarUsuarioPage.apagarEmail();
    var dado = tabela.rowsHash();
    atualizarUsuarioPage.preencherEmail(dado.Email)
})

Then('visualizo a mensagem de erro "Formato de e-mail inválido."', () => {
    atualizarUsuarioPage.clicarBotaoConfirmarAlteracoes();
    atualizarUsuarioPage.ValidarMensagemEmailInvalido();
    atualizarUsuarioPage.detelarUsuario();
})

//Validar botão histórico
When("seleciono a opção histórico", () => {
    atualizarUsuarioPage.validarHistorico();
})

Then("visualizo meu histórico de lista de compras", () => {
    atualizarUsuarioPage.headerHistorico();
    atualizarUsuarioPage.detelarUsuario();
})

//Validar botão lita
When("seleciono a opção lista", () => {
    atualizarUsuarioPage.ValidarLista();
})

Then("visualizo minha lista de compras", () => {
    atualizarUsuarioPage.headerLista();
    atualizarUsuarioPage.detelarUsuario();
})

//Validar Logout
When("seleciono a opção sair", () => {
    atualizarUsuarioPage.clicarOpcoes();
    atualizarUsuarioPage.clicarEmSair();
    atualizarUsuarioPage.detelarUsuario();
})

Then("visualizo a tela de login", () => {
    atualizarUsuarioPage.telaLogin();
})