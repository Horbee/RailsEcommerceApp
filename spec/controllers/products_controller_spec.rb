require 'rails_helper'

describe ProductsController, type: :controller do

    before do
        @user = FactoryBot.create(:user)
        @admin = FactoryBot.create(:admin)
        @product = FactoryBot.create(:product)
    end

    context "GET #index" do
        it "renders the products' index template" do
            get :index
            expect(response).to be_ok
            expect(response).to render_template('index')
        end
    end

    context 'GET #show' do
        it "renders the products show template" do
            get :show, params: {id: @product.id}
            expect(response).to be_ok  
            expect(assigns(:product)).to eq @product
        end
    end

    context 'GET #new' do
        it "renders the new product form template if admin is signed in" do
            sign_in @admin
            get :new
            expect(response).to be_ok  
        end

        it "does not render the new product form template if user is not an admin" do
            sign_in @user
            get :new
            expect(response).not_to be_ok  
        end
    end

    describe 'GET #edit' do
        context 'when an admin is logged in' do
            before do
                sign_in @admin
            end

            it "can edit product when user is confimed and he is an admin" do
                get :edit, params: {id: @product.id}
                expect(response).to be_ok  
                expect(assigns(:product)).to eq @product
            end

            it "can not edit product when user is not an admin" do
                sign_in @user
                get :edit, params: {id: @product.id}
                expect(response).not_to be_ok  
            end
        end        
      
        context 'when a user is not logged in' do
            it "redirects to login" do
                get :edit, params: {id: @product.id}
                expect(response).to redirect_to new_user_session_path 
            end
        end
    end

    context 'POST #create' do
        it "if user is an admin he can create the object" do
            sign_in @admin
            @product2 = FactoryBot.create(:product)
            expect(response).to be_successful
        end
    end  
    
    describe "DELETE #destroy" do
        it 'user is an admin he can destroy the product' do
            sign_in @admin
            delete :destroy, params: { id: @product.id }
            expect(response).to redirect_to products_url
        end

        it 'user is not an admin he can not destroy the product' do
            sign_in @user
            delete :destroy, params: { id: @product.id }
            expect(response).not_to redirect_to products_url
        end
    end

    context 'PUT #update' do
        before do
            @product3 = Product.create!(name: "supplement", description: "Something here", image_url: "nil.jpg", price: 1200)
        end
        it "requires login" do
            put :update, params: { id: @product3.id }
            expect(response).to be_redirect
        end

        it "requires admin right" do
            sign_in @user
            put :update, params: { id: @product3.id }
            expect(response).to have_http_status(302)
        end

    end
    
end
