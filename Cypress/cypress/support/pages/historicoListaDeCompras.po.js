class HistoricoListaDeComprasPage {

    clicarNoHistorico() {
        cy.get("a[href='/historico']").click();
    }

    exibeHistoricoDeListas() {
        cy.contains("h2", "Histórico").should("be.visible");        
        //Div listas
        cy.get(".kUIcKA").should("be.visible");
    }
    exibeNomeEDataLista() {
        cy.contains(".kUIcKA > p", "Lista Compra 1").should("be.visible");
        cy.contains(".kUIcKA > span", "Criada em: 25/05/2022").should("be.visible");

    }
}
export var historicoListaDeComprasPage = new HistoricoListaDeComprasPage();