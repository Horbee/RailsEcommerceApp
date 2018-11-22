require 'rails_helper'

describe User do
    context "when the user is being validated" do
        it "user is invalid without a first_name" do
            expect(User.new(last_name: "H", email: "horox@gmail.com", password: "password", confirmed_at: Time.now)).not_to be_valid
        end

        it "user is invalid without a last_name" do
            expect(User.new(first_name: "H", email: "horox@gmail.com", password: "password", confirmed_at: Time.now)).not_to be_valid
        end

        it "user is invalid without a email" do
            expect(User.new(first_name: "N", last_name: "H", password: "password", confirmed_at: Time.now)).not_to be_valid
        end

        it "user is invalid without a password" do
            expect(User.new(first_name: "N", last_name: "H", email: "horox@gmail.com", confirmed_at: Time.now)).not_to be_valid
        end
    end
end
