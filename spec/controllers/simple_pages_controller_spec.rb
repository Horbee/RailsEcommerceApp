require 'rails_helper'

describe SimplePagesController, type: :controller do
    context "GET #contact" do
        it "renders the contact template" do
            get :contact
            expect(response).to be_ok
            expect(response).to render_template('contact')
        end
    end

    context "GET #about" do
        it "renders the about template" do
            get :about
            expect(response).to be_ok
            expect(response).to render_template('about')
        end
    end

    context "GET #landing_page" do
        it "renders the landing_page template" do
            get :landing_page
            expect(response).to be_ok
            expect(response).to render_template('landing_page')
        end
    end
    
end
