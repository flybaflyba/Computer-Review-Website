FactoryBot.define do 
    factory :user do |f|
        f.sequence(:username) {|n| "Test User #{n}"}
        f.sequence(:firstname) {|n| "Test Firstname #{n}"}
        f.sequence(:lastname) {|n| "Test Lastname #{n}"}
        f.sequence(:email) {|n| "testemail#{n}@test.com"}
        f.password {"password"}
        f.password_confirmation {|d| d.password }
    end
    factory :computer do |f|
        f.sequence(:model) {|n| "Test Model #{n}"}
        f.sequence(:price) {|n| "Test Price #{n}"}
        f.sequence(:cpu) {|n| "Test CPU #{n}"}
        f.sequence(:os) {|n| "Test OS #{n}"}
        f.sequence(:disk) {|n| "Test Disk #{n}"}
        f.sequence(:ram) {|n| "Test RAM #{n}"}
        f.sequence(:screen) {|n| "Test Screen #{n}"}
        f.association :user
        
        # what do we do with image test? 
    end
        
end
