require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  test "Signing up" do
    visit signup_path
    
    fill_in "Username", with: "testUserName"
    fill_in "Firstname", with: "testFirstname"
    fill_in "Lastname", with: "testLastname"
    fill_in "Email", with: "testemail@account.com"
    fill_in "Password", with: "testpassword"
    fill_in "Confirm Password", with: "testpassword"
    
    click_on "Create Account"

    # what we should see
    assert_text "Account Created" 
    assert_selector "nav", text: "Logout"
    
    # what we should not see
    refute_selector "nav", text: "Login"
  end
  
  test "Signing up doesn't work with error" do
    visit signup_path
    
    fill_in "Username", with: "testUserName"
    fill_in "Firstname", with: "testFirstname"
    fill_in "Lastname", with: "testLastname"
    # fill_in "Email", with: "testemail@account.com"
    fill_in "Password", with: "testpassword"
    fill_in "Confirm Password", with: "testpassword"
    
    click_on "Create Account"

    # what we should see
    assert_text "Please fix the errors below" 
    assert_selector "nav", text: "Login"
    
    # what we should not see
    refute_selector "nav", text: "Logout"
  end
  
  test "Login works" do
  # Factory bot will generate a user, we need a factory file to generate it. 
    user = FactoryBot.create :user, email: "test@test.com", password: "testpassword"
    
    visit login_path
    fill_in "Email", with: "test@test.com"
    fill_in "Password", with: "testpassword"
    
    click_on "Login"
    
    assert_text "Logged In"
    assert_selector "nav", text: "Logout"
    refute_selector "nav", text: "Login"
  end  
  
  test "Login fails" do
    user = FactoryBot.create :user, email: "test@test.com", password: "testpassword"
    
    visit login_path
    fill_in "Email", with: "test@test.com"
    fill_in "Password", with: "wrongpassword"
    
    click_on "Login"
    
    assert_text "invalid email/password"
    assert_selector "nav", text: "Login"
    refute_selector "nav", text: "Logout"
  end  
  
  
  
end
