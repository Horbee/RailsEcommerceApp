require 'rails_helper'

describe Comment do
    context "when the comment is being validated" do
        let(:product) { Product.create!(name: "n", description: "d", price: 1, image_url: "placeholder.jpg") }
        let(:user) { User.create!(first_name: "H", last_name: "L", email: "hhh@gmail.com", password: "password", confirmed_at: Time.now) }

        it "user is invalid without a body" do
            expect(Comment.new(body: "b", user: user, product: product)).not_to be_valid
        end

        it "user is invalid without a title" do
            expect(Comment.new(title: "b", user: user, product: product)).not_to be_valid
        end
    end
end
