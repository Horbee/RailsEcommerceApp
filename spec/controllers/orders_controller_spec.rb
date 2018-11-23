require 'rails_helper'

describe OrdersController, type: :controller do
    let(:user) { User.create!(email:"hh@gmail.com", password: "password", first_name: "H", last_name: "N", confirmed_at: Time.now) }
    let(:user_second) { User.create!(email:"geg@gmail.com", password: "password", first_name: "H", last_name: "N", confirmed_at: Time.now) }
    let(:product) { Product.create!(name: "n", description: "d", price: 5, image_url: "placeholder.jpg") }
    let(:order) { Order.create!(user: user, product: product, total: product.price) }
    let(:order_second) { Order.create!(user: user_second, product: product, total: product.price) }


    describe 'GET #show' do
        context 'when a user is logged in' do
            before do
                sign_in user
            end

            it "loads correct the user's order details" do
                get :show, params: {id: order.id}
                expect(response).to be_ok  
                expect(assigns(:order)).to eq order
            end

            it "cannot access the other user's order details" do
                get :show, params: {id: order_second.id}
                expect(response).to have_http_status(302)
                expect(response).to redirect_to root_path
            end
        end        
      
        context 'when a user is not logged in' do
            it "redirects to login" do
                get :show, params: {id: order.id}
                expect(response).to redirect_to new_user_session_path 
            end
        end
    end

    describe 'DELETE #destroy' do
        context 'when a user is logged in' do
            before do
                sign_in user
            end

            it 'can delete own orders' do
                delete :destroy, params: { id: order.id }
                expect(response).to have_http_status(302) 
            end

            it 'cannot delete other users orders' do
                delete :destroy, params: { id: order_second.id }
                expect(response).to have_http_status(302)
                expect(response).to redirect_to root_path
            end
        end
    end
    
end
