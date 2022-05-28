class HistoricoListaDeComprasPage {

    clicarNoHistorico() {
        cy.get("a[href='/historico']").click();
    }

    exibirHistoricoDeListas() {
        cy.get(".kUIcKA").should('have.length', 10);
    }

    exibirNomeEDataLista() {
        cy.contains(".kUIcKA > p", "Lista Compra 1").should("be.visible");
        cy.contains(".kUIcKA > span", "Criada em: 25/05/2022").should("be.visible");
    }

    clicarEmLista() {
        cy.get(".kUIcKA").first().click();
    }

    exibirItenslista() {
        cy.get(".eymWbx").should("be.visible");
        cy.get(".laysmB").should("be.visible");
    }
}
export var historicoListaDeComprasPage = new HistoricoListaDeComprasPage();