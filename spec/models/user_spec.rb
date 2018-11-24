require 'rails_helper'

describe User do
    context "when the user is being validated" do
        it "user is invalid without a first_name" do
            @user = FactoryBot.build(:user, first_name: nil)
            expect(@user).to_not be_valid
        end

        it "user is invalid without a last_name" do
            @user = FactoryBot.build(:user, last_name: nil)
            expect(@user).to_not be_valid
        end

        it "user is invalid without a email" do
            @user = FactoryBot.build(:user, email: nil)
            expect(@user).to_not be_valid
        end

        it "user is invalid without a password" do
            @user = FactoryBot.build(:user, password: nil)
            expect(@user).to_not be_valid
        end
    end
end
