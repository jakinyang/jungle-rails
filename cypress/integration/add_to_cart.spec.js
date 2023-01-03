/// <reference types="cypress" />

describe('Application', () => {
  beforeEach(() => {
  })
  
  it('raises the cart count by one', () => {
    cy.visit('http://localhost:3000/')
    cy.get('article').first().click()
    cy.get('.button_to .btn').click()
    cy.get('ul.navbar-nav').last().children().last().should('include.text', 'My Cart (1)')
  })
})
