class UsersController < ApplicationController
  

  
  def index
  end
  
  def new 
    @user = User.new
  end
  
  def create 
    @user = User.new user_params
    if @user.save
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
