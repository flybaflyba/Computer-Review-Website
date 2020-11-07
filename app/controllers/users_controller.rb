class UsersController < ApplicationController
  

  
  def index
  end
  
  def new 
    if session[:user_hash]
      @user = User.new_from_hash(session[:user_hash])
      @user.valid?
    else
      @user = User.new
    end
  end
  
  def create 
    if session[:user_hash]
      @user = User.new_from_hash(session[:user_hash])
      @user.username = user_params[:username]
      @user.email = user_params[:email]
    else
      @user = User.new user_params
    end
    # @user = User.new user_params
    if @user.save
      session[:user_hash] = nil
      login(@user)
      redirect_to root_path, notice: "Account Created"
    else 
      render :new
    end
  end
  
  def show 
    @user = current_user
  end
  
  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    if @user.update user_params
      redirect_to current_user, notice: "Account Updated."
    else
      render :edit
    end
  end
  
  def destroy
    
    @user = current_user
    @user.destroy
    logout
    redirect_to root_path, alert: "Account Deleted."
  end
  
  private 
  
  def user_params
    params.require(:user).permit(:username,:email,:password,:password_confirmation,:firstname,:lastname)
  end
  

  
end
