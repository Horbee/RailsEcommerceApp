require 'rails_helper'

describe CommentsController, type: :controller do
    let(:product) { Product.create!(name: "n", description: "d", price: 5, image_url: "placeholder.jpg") }
    let(:user) { User.create!(email:"hh@gmail.com", password: "password", first_name: "H", last_name: "N", confirmed_at: Time.now) }
    let(:comment) { Comment.create!(title: "t", body: "b", rating: 5, user: user, product: product) }

    describe 'POST #create' do
        context 'when a user is logged in' do
            before do
                sign_in user
            end

            it "can create comments if confirmed" do
                post :create, params: {comment: {title: "t", body:"b", rating: 5}, product_id: product.id}
                expect(response).to have_http_status(302) 
            end

            it "cannot delete if user not admin" do
                delete :destroy, params: { product_id: product.id, id: comment.id }
                expect(response).to have_http_status(302) 
            end
        end
    end
    
end
