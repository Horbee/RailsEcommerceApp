require 'rails_helper'

describe Cart do
  context "when the cart is being created" do
    it "the cart is invalid without a user" do
      expect(FactoryBot.build(:cart, user_id: nil)).not_to be_valid
    end
  end

  context "when the cart has products in it," do

    before do
      @cart = FactoryBot.create(:cart)
      @product = FactoryBot.create(:product)
      @product2 = FactoryBot.create(:product)
      @cart.add_product(@product)
      @cart.add_product(@product)
      @cart.add_product(@product2)
      @cart.remove_product(@cart.cart_line_items.first.id)
    end

    it "returns the total price of all items in it" do
      expect(@cart.price).to eq @product.price + @product2.price
    end

end

end
