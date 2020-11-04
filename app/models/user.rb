class User < ApplicationRecord
    has_secure_password
    has_many :computers
    
    validates :email, format: { with: /@/, message: "must have an @"}, uniqueness: true
    validates :username, presence: true
end
