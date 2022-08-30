describe('product_details', () => {
  beforeEach(() => {
    cy.visit('http://localhost:3000')
  })
  it("clicks on a product and visit product page", () => {
    cy.contains("Scented Blade").click();
  }); 
})