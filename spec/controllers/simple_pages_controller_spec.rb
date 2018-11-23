require 'rails_helper'

describe SimplePagesController, type: :controller do
    context "GET #landing_page" do
        it "renders the landing_page template" do
            get :landing_page
            expect(response).to be_ok
            expect(response).to render_template('landing_page')
        end
        
    end
    
end
