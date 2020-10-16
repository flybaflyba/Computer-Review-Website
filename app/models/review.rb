class Review < ApplicationRecord
    
    belongs_to :computer
    
    validates :content, presence: true
end
