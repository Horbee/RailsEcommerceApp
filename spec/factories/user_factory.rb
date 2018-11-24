FactoryBot.define do
    sequence(:email) { |n| "user#{n*32}@example.com" }
    
    factory :user do
        email 
        password "password"
        first_name "F"
        last_name "L"
        admin false
        confirmed_at Time.now
    end

    factory :admin, class: User do
        email 
        password "password"
        first_name "F"
        last_name "L"
        admin true
        confirmed_at Time.now 
    end
end