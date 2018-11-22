require 'rails_helper'

context "when the order is being created" do

    it "order is invalid without a total amount of price" do
        expect(Order.new()).not_to be_valid
    end

end