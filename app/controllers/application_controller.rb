class ApplicationController < ActionController::Base
    
    private 
    
    def authenticate
        unless current_user
            redirect_to login_path, alert: "You must login to perform this action"
        end
    end
    
    def login(user)
        session[:user_id] = user.id
    end
    
    def logout
        session[:user_id] = nil
    end
    
    def current_user
       
        # if @current_user
        #     @current_user
        # else
        #     @current_user = User.find session[:user_id] if session[user_id]  # if there is a user found, return the user, other wise, return nil
        # end
        # do it in one line
        
        @current_user ||= User.find session[:user_id] if session[:user_id]  # if there is a user found, return the user, other wise, return nil

    end
    
    # make the method visibe to view files 
    helper_method :current_user 
    
    
    
    
end
