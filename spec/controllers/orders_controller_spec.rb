require 'rails_helper'

describe OrdersController, type: :controller do

    before do
        @user = FactoryBot.create(:user)
        @user_second = FactoryBot.create(:user)
        @order = FactoryBot.create(:order, user: @user)
        @order_second = FactoryBot.create(:order, user: @user_second)
    end

    describe 'GET #show' do
        context 'when a user is logged in' do
            before do
                sign_in @user
            end

            it "the user gets his orders" do
                get :index
                expect(response).to be_ok  
                expect(response).to render_template('index')
            end

        end        
      
        context 'when a user is not logged in' do
            it "redirects to login" do
                get :index
                expect(response).to redirect_to new_user_session_path 
            end
        end
    end

    describe 'DELETE #destroy' do
        context 'when a user is logged in' do
            before do
                sign_in @user
            end

            it 'can delete own orders' do
                delete :destroy, params: { id: @order.id }
                expect(response).to have_http_status(302) 
            end

            it 'cannot delete other users orders' do
                delete :destroy, params: { id: @order_second.id }
                expect(response).to have_http_status(302)
                expect(response).to redirect_to root_path
            end
        end
    end
    
end
