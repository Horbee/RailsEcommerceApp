require 'rails_helper'

describe UsersController, type: :controller do

    before do
        @user = FactoryBot.create(:user)
        @user_second = FactoryBot.create(:user)
        @user_admin = FactoryBot.create(:admin)
    end

    describe 'GET #show' do
        context 'when a user is logged in' do
            before do
                sign_in @user
            end

            it "loads correct user details" do
                get :show, params: {id: @user.id}
                expect(response).to be_ok  
                expect(assigns(:user)).to eq @user
            end

            it "cannot access the other user's details" do
                get :show, params: {id: @user_second.id}
                expect(response).to have_http_status(302)
                expect(response).to redirect_to root_path
            end
        end

        context "when a user is singed in and has admin rights" do
            before do
                sign_in @user_admin
            end

            it "can access the other user's details if user is admin" do
                get :show, params: {id: @user_second.id}
                expect(response).to be_ok
                expect(assigns(:user)).to eq @user_second
            end
        end
        
      
        context 'when a user is not logged in' do
            it "redirects to login" do
                get :show, params: {id: @user.id}
                expect(response).to redirect_to new_user_session_path 
            end
        end
    end
    
end
