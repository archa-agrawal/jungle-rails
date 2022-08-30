require 'rails_helper'

RSpec.describe Product, type: :model do
  product = nil
  before do
    category = Category.new(name: 'new')
    product = Product.new(name:'plant', price: 1000, quantity: 10, category: category)
    product.save
  end
  
  describe 'Validations' do

    it "is a valid product when all the valeus are given" do
      expect(product).to be_valid
    end

    it "is not valid when product name is not given" do
      product.name = nil
      expect(product).to_not be_valid
    end

    it "is not valid when product price is not given" do
      product.name = 'plant'
      product.price = ''
      expect(product).to_not be_valid
    end

    it "is not valid when product quantity is not given" do
      product.price = 100
      product.quantity = ''
      expect(product).to_not be_valid
    end

    it "is not valid when product category is not given" do
      product.quantity = 10
      product.category = nil
      expect(product).to_not be_valid
    end



    

    
  end
end
