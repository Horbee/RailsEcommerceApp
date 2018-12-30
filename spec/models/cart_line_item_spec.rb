require 'rails_helper'

describe CartLineItem do
  context "When the CartLineItem has a price in cents saved" do
    
    before do
      @cli = FactoryBot.create(:cart_line_item)
    end

    it "converted total price method returns the total price in proper format" do
      expect(@cli.converted_total_price).to eq @cli.product.price * @cli.quantity * 0.01
    end
    
  end
end
