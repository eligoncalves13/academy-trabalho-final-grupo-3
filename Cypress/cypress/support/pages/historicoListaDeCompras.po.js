class HistoricoListaDeComprasPage {

    acessarPaginaInicial() {
        cy.visit("/lista");
    }

    clicarNoHistorico() {
        cy.contains("a[href='/historico']", "Histórico").click();
    }

    clicarNoMenuOpcoes() {
        cy.get(".bgBaRw").should("be.visible").click();
        cy.get(".eLmrFd").should("be.visible");
    }

    clicarNaOpcaoHistorico() {
        cy.get("a.cvtYsR[href='/historico']").should("be.visible").click();
    }

    clicarEmLista() {
        cy.get(".kUIcKA").first().should("be.visible").click();
    }

    clicarNaOpcaoPaginaInicial() {
        cy.get("a.cvtYsR[href='/lista']").should("be.visible").click();
    }

    exibirHistoricoDeListas() {
        cy.contains("h2", "Histórico").should("be.visible");
        cy.get(".kUIcKA").should("have.length", 10);
    }

    exibirNomeEDataLista() {
        cy.contains(".kUIcKA > p", "Lista Compra 1").should("be.visible");
        cy.contains(".kUIcKA > span", "Criada em: 25/05/2022").should("be.visible");
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