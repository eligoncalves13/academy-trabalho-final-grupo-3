import { atualizarUsuarioPage } from "../pages/atualizarUsuario.po";
import { faker } from '@faker-js/faker'

const user = { 
    name: faker.name.firstName() + ' ' + faker.name.lastName(),
    email: faker.internet.email().toLowerCase(),
    password: faker.internet.password()
}

Given("acessei o sistema Lembra Compras", () => {
    atualizarUsuarioPage.acessarLogin();
});

When("informo os dados válidos do usuário para cadastrar e logar no sistema", () => {
    atualizarUsuarioPage.clicarBotaoRegistrase();
    atualizarUsuarioPage.criarUsuario(user.name, user.email, user.password, user.password);
    atualizarUsuarioPage.clicarEmRegistrar();
    atualizarUsuarioPage.preencherLogin(user.email, user.password);
});

Then("visualizo o perfil no menu de opções", () => {
    atualizarUsuarioPage.clicarOpcoes();
    atualizarUsuarioPage.clicarPerfil();
})

When("informo o nome válido para editar o perfil", () => {
    
    atualizarUsuarioPage.preencherNome(faker.name.firstName() + ' ' + faker.name.lastName());
    atualizarUsuarioPage.clicarBotaoConfirmarAlteracoes();
    atualizarUsuarioPage.clicarBotaoConfirma();

    //atualizarUsuarioPage.detelarUsuario();
})

Then('visualizo a mensagem de sucesso "Informações atualizadas com sucesso!"', () => {
    atualizarUsuarioPage.validarMensagem();
})
    




