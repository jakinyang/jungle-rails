/// <reference types="cypress" />

describe('Application', () => {
  beforeEach(() => {
    cy.visit('http://localhost:3000/')
  })

  it('displays page header on home page', () => {
    cy.get('.intro').should('be.visible')

    cy.get('.intro p').first().should('include.text', 'Looking for a way')
    cy.get('.intro p').last().should('include.text', 'We have a wide variety')
  })

  it("displays products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("Displays 2 products on the page", () => {
    cy.get(".products article").should("have.length.above", 2);
  });
})
