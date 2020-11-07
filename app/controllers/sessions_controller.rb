class SessionsController < ApplicationController
  def new
  end
  
  def create 
    @user = User.where(email: params[:email]).first
    if @user && @user.authenticate(params[:password])
     login(@user)
      redirect_to root_path, notice: "Logged In"
    else
      redirect_to login_path, alert: "invalid email/password"
    end 
    rescue BCrypt::Errors::InvalidHash
      redirect_to login_path, alert: "Invalid Password. Did you sign up with GitHub?"
  end
  
  def destroy
    logout
    redirect_to root_path, notice: "Logged out"
  end
  
end
