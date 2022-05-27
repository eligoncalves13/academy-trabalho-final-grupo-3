import { atualizarUsuarioPage } from "../pages/atualizarUsuario.po";
import { faker } from '@faker-js/faker'

const user = { 
    name: faker.name.firstName(),
    email: faker.internet.email().toLowerCase(),
    password: faker.internet.password()
}

Given ("acessei o sistema Lembra Compras", () => {
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
    atualizarUsuarioPage.preencherNomeCompleto(faker.name.firstName());
    atualizarUsuarioPage.clicarBotaoConfirmarAlteracoes();
    atualizarUsuarioPage.clicarBotaoConfirma();
})


