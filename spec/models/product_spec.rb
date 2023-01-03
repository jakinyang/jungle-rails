require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "Validations" do
    it "returns true when name, price, quantity, and category are present is present" do
      @category = Category.create(name: "Plant")
      
      expect(@category.products.new(name: "Pothos", price: 4.99, quantity: 12).valid?).to be true
    end
    it "returns false when name is not present" do
      @category = Category.create(name: "Plant")
      expect(@category.products.new(name: nil, price: 4.99, quantity: 12).valid?).to be false
    end
    it "returns false when price is not present" do
      @category = Category.create(name: "Plant")
      expect(@category.products.new(name: "Pothos", quantity: 12).valid?).to be false
    end
    it "returns false when quantity is not present" do
      @category = Category.create(name: "Plant")
      expect(@category.products.new(name: "Pothos", price: 4.99, quantity: nil).valid?).to be false
    end
    it "returns false when category is not present" do
      expect(Product.create(name: "Pothos", price: 4.99, quantity: 12).valid?).to be false
    end
    
  end
end
