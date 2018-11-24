FactoryBot.define do

    factory :order do
        user #association :user, factory: :user 
        product #association :product, factory: :product 
        total 5
    end
end