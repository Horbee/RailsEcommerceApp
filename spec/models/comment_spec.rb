require 'rails_helper'

describe Comment do
    context "when the comment is being validated" do
        it "user is invalid without a body" do
            @comment = FactoryBot.build(:comment, body: nil)
            expect(@comment).not_to be_valid
        end

        it "user is invalid without a title" do
            @comment = FactoryBot.build(:comment, title: nil)
            expect(@comment).not_to be_valid
        end
    end
end
