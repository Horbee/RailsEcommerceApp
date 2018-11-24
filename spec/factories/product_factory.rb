FactoryBot.define do
    sequence(:name) { |n| "productname#{n}" }

    factory :product do
        name 
        description "desc"
        price 5
        image_url "placeholder.jpg"
    end
end