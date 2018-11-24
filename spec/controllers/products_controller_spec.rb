require 'rails_helper'

describe ProductsController, type: :controller do

    before do
        @user = FactoryBot.create(:user)
        @product = FactoryBot.create(:product)
    end

    describe 'GET #edit' do
        context 'when a user is logged in' do
            before do
                sign_in @user
            end

            it "can edit product when confimed" do
                get :edit, params: {id: @product.id}
                expect(response).to be_ok  
                expect(assigns(:product)).to eq @product
            end

        end        
      
        context 'when a user is not logged in' do
            it "redirects to login" do
                get :edit, params: {id: @product.id}
                expect(response).to redirect_to new_user_session_path 
            end
        end
    end
    
end
