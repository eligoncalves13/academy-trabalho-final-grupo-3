import { faker } from '@faker-js/faker';

const API_URL = 'https://lista-compras-api.herokuapp.com/api/v1';

Cypress.Commands.add('logout', () => {
    cy.window().its('sessionStorage').invoke('removeItem', 'sessionData');
});

Cypress.Commands.add('cadastrarUsuarioLogin', () => {
    const usuario = {
        name: "Raro Academy",
        email: faker.internet.email().toLowerCase(),
        password: "senha1234"
    }

    cy.request({
        url: `${API_URL}/users`,
        method: "post",
        body: usuario
    }).then(() => cy.request({
        url: `${API_URL}/auth/login`,
        method: "post",
        form: true,
        body: {
            email: usuario.email,
            password: usuario.password
        }
    }).its('body'))
        .then((sessionData) => cy.window().its('sessionStorage').invoke('setItem', 'sessionData', JSON.stringify(sessionData)));
});

Cypress.Commands.add('deletarUsuario', () => {
    cy.window().then(window => {
        const sessionData = window.sessionStorage.getItem('sessionData');
        if (!sessionData) return;

        const token = JSON.parse(sessionData).session.token

        cy.request({
            url: `${API_URL}/cancel-account`,
            method: "delete",
            headers: {
                "X-JWT-Token": token
            }
        }).then(() => window.sessionStorage.removeItem('sessionData'));
    });
});