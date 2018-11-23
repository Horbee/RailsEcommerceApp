require 'rails_helper'

describe ProductsController, type: :controller do
    let(:user) { User.create!(email:"hh@gmail.com", password: "password", first_name: "H", last_name: "N", confirmed_at: Time.now) }
    let(:product) { Product.create!(name: "n", description: "d", price: 5, image_url: "placeholder.jpg") }

    describe 'GET #edit' do
        context 'when a user is logged in' do
            before do
                sign_in user
            end

            it "can edit product when confimed" do
                get :edit, params: {id: product.id}
                expect(response).to be_ok  
                expect(assigns(:product)).to eq product
            end

        end        
      
        context 'when a user is not logged in' do
            it "redirects to login" do
                get :edit, params: {id: product.id}
                expect(response).to redirect_to new_user_session_path 
            end
        end
    end
    
end
