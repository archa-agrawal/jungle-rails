describe('product_details', () => {
  beforeEach(() => {
    cy.visit('http://localhost:3000')
  })
  it("clicks on add to cart and increases the number of items in the cart", () => {
    cy.contains("My Cart (0)")
    cy.contains("Add").first().click({force: true});
    cy.contains("My Cart (1)")
  }); 
})