Cypress.Commands.add('logout', () => {
    cy.window().its('sessionStorage').invoke('removeItem', 'sessionData');    
});