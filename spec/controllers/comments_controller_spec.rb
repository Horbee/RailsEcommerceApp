require 'rails_helper'

describe CommentsController, type: :controller do

    before do
        @user = FactoryBot.create(:user)
        @comment = FactoryBot.create(:comment)
        @product = FactoryBot.create(:product)
    end

    describe 'POST #create' do
        context 'when a user is logged in' do
            before do
                sign_in @user
            end

            it "can create comments if user's account is confirmed" do
                post :create, params: {comment: {title: @comment.title, body: @comment.body, rating: @comment.rating}, product_id: @product.id}
                expect(response).to have_http_status(302) 
            end

        end
    end

    describe 'DELETE #destroy' do
        context 'when user is logged in' do
            before do
                sign_in @user
            end

            it "cannot delete comment if user is not an admin" do
                delete :destroy, params: { product_id: @product.id, id: @comment.id }
                expect(response).to have_http_status(302) 
            end

            it "can delete comment if user is an admin" do
                @user.admin = true
                delete :destroy, params: { product_id: @product.id, id: @comment.id }
                expect(response).to have_http_status(302) 
                expect(response).to redirect_to root_path
            end
        end
    end
    
end
