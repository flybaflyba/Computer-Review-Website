FactoryBot.define do 
    factory :user do |f|
        f.sequence(:username) {|n| "Test User #{n}"}
        f.sequence(:firstname) {|n| "Test Firstname #{n}"}
        f.sequence(:lastname) {|n| "Test Lastname #{n}"}
        f.sequence(:email) {|n| "testemail#{n}@test.com"}
        f.password {"password"}
        f.password_confirmation {|d| d.password }
    end
end
