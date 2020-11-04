class User < ApplicationRecord
    has_secure_password
    
    validates :email, format: { with: /@/, message: "must have an @"}, uniqueness: true
    validates :username, presence: true
end
