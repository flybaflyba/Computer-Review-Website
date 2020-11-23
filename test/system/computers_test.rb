require "application_system_test_case"

class ComputersTest < ApplicationSystemTestCase
  
  test "valid computer" do 
    computer = FactoryBot.build :computer
    assert computer.valid?
  end
  
  test "invalid computer without model" do 
    computer = FactoryBot.build :computer
    computer.model = nil
    refute computer.valid?
  end
  
  test "invalid computer without user" do 
    computer = FactoryBot.build :computer
    computer.user = nil
    refute computer.valid?
  end
  
  
  test "visiting computers page" do
    
    # factorybot create user for each computer. 
    # if we dont want this we create a user then log it in 
    user = login_user 
    computer1 = FactoryBot.create :computer, user: user
    computer2 = FactoryBot.create :computer, user: user
    
    visit computers_path
    
    assert_text computer1.model
    assert_text computer2.model
  end
  
  test "creating new computer works" do 
    user = login_user
    
    visit new_computer_path(user)
    
    fill_in "Model", with: "test model"
    fill_in "Price", with: "test price"
    fill_in "Cpu", with: "test cpu"
    fill_in "Os", with: "test os"
    fill_in "Disk", with: "test disk"
    fill_in "Ram", with: "test ram"
    fill_in "Screen", with: "test screen"
    
    click_on "Create Computer"
    
    assert_text "Computer Created"
    refute_text "Please fix the errors below"
    
  end
  
  test "creating new computer fails" do 
    # we have to login before create 
    user = login_user
    
    visit new_computer_path(user) # this works, without parentheses and parameter, it also works 
    
    # if we don't fill up the model, it will fail
    # fill_in "Model", with: "test model"
    fill_in "Price", with: "test price"
    fill_in "Cpu", with: "test cpu"
    fill_in "Os", with: "test os"
    fill_in "Disk", with: "test disk"
    fill_in "Ram", with: "test ram"
    fill_in "Screen", with: "test screen"
    
    click_on "Create Computer"
    
    assert_text "Please fix the errors below"
    refute_text "Computer Created"
    
  end
  
  
  test "show, edit and update then show again" do 
    user = login_user 
    computer = FactoryBot.create :computer, user: user, model: "testmodel"
    
    # test for show action 
    
    visit computers_path(computer)
    
    assert_text "testmodel"
    
    # test for edit screen 
    
    # click_on "Edit"
    visit edit_computer_path(computer)
    
    assert_text "Edit Computer"
    
    fill_in "Model", with: "testmodelupdated"
    
    click_on "Update Computer"
    
    # test if the compater is updated 
    
    assert_text "Computer Updated"
    assert_text "testmodelupdated"
    
    
  end
  
  
  
  
end
