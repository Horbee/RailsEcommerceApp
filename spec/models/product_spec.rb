require 'rails_helper'

describe Product do
    context "when the product has comments" do
        let(:product) { Product.create!(name: "Racing laptop", description: "Desc", price: 200, image_url: "placeholder.jpg") }
        let(:user) { 
            User.create!(first_name: "N", last_name: "H", email: "horox@gmail.com", password: "password", confirmed_at: Time.now) 
        
        }

        before do
            product.comments.create!(user: user, title: "Title", body: "Body", rating: 5)
            product.comments.create!(user: user, title: "Title", body: "Body", rating: 3)
            product.comments.create!(user: user, title: "Title", body: "Body", rating: 1)
        end

        it "returns the average rating of all comments" do
            expect(product.average_rating).to eq 3
        end

        it "returns the highest rating comment of all comments" do
            expect(product.highest_rating_comment).to eq product.comments.first
        end

        it "returns the lowest rating comment of all comments" do
            expect(product.lowest_rating_comment).to eq product.comments.last
        end

        it "product is invalid without a name" do
            expect(Product.new(description: "desc", price: 2)).not_to be_valid
        end

        it "product is invalid without a description" do
            expect(Product.new(name: "name", price: 2)).not_to be_valid
        end

        it "product is invalid without a price" do
            expect(Product.new(name: "name", description: "desc")).not_to be_valid
        end
    end
end
