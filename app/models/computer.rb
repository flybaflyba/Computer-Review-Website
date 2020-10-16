class Computer < ApplicationRecord
    has_many :reviews
    
    # a computer must have a name before being saved  
    validates :model, presence: true 
    
    
end
