require "application_system_test_case"

class ComputersTest < ApplicationSystemTestCase
  test "visiting computers page" do
    
    # factorybot create user for each computer. 
    # if we dont want this we create a user then log it in 
    user = login_user 
    computer1 = FactoryBot.create :computer
    computer2 = FactoryBot.create :computer
    
    visit computers_path
    
    assert_text computer1.model
    assert_text computer2.model
  end
  
  
  
  
  
end
