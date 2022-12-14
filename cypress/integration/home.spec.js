describe('home page', () => {
  beforeEach(() => {
    cy.visit('http://localhost:3000')
  })
  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });
  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  // it('displays two todo items by default', () => {
  //   // We use the `cy.get()` command to get all elements that match the selector.
  //   // Then, we use `should` to assert that there are two matched items,
  //   // which are the two default items.
  //   cy.get('.todo-list li').should('have.length', 2)

  //   // We can go even further and check that the default todos each contain
  //   // the correct text. We use the `first` and `last` functions
  //   // to get just the first and last matched elements individually,
  //   // and then perform an assertion with `should`.
  //   cy.get('.todo-list li').first().should('have.text', 'Pay electric bill')
  //   cy.get('.todo-list li').last().should('have.text', 'Walk the dog')
  // })

})