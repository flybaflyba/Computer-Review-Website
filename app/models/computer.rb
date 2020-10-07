class Computer < ApplicationRecord
    
    # a computer must have a name before being saved  
    validates :model, presence: true 
    
    
end
