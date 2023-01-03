/// <reference types="cypress" />

describe('Application', () => {
  beforeEach(() => {
    cy.visit('http://localhost:3000/')
    cy.get(".products article").first().click()
  })

  it('displays the product show page', () => {
    cy.get('section.products-show').should('be.visible')
  })
})
