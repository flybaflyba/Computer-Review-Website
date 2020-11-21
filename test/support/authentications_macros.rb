module AuthenticationMacros
    def login_user(options = {})
        options[:password] ||="passwordhere" # if not password, we set it
        user = FactoryBot.create :user, options # create a user
        
        visit login_path
        fill_in "Email", with: user.email
        fill_in "Password", with: options[:password]
        click_button "Login"
        user # returns of this function
    end
end