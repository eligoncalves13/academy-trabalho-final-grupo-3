class HistoricoListaDeComprasPage {

    clicarNoHistorico() {
        cy.get("a[href='/historico']").click();
    }

    exibirHistoricoDeListas() {
        cy.contains("h2", "Histórico").should("be.visible");
        cy.get(".kUIcKA").should("have.length", 10);
    }

    exibirNomeEDataLista() {
        cy.contains(".kUIcKA > p", "Lista Compra 1").should("be.visible");
        cy.contains(".kUIcKA > span", "Criada em: 25/05/2022").should("be.visible");
    }

    clicarEmLista() {
        cy.get(".kUIcKA").first().should("be.visible").click();
    }

    exibirItenslista() {
        cy.get(".eymWbx").find("h2").should("be.visible");
        cy.get(".laysmB").should("be.visible");
    }

    exibirHistoricoVazio() {
        cy.contains("h2", "Histórico").should("be.visible");
        cy.get(".fqluPa").children().should("have.length", 0);
    }
}
export var historicoListaDeComprasPage = new HistoricoListaDeComprasPage();