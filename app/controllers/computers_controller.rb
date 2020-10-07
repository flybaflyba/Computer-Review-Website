class ComputersController < ApplicationController
  
  # call load_computer before every pubice method get called, expect...
  before_action :load_computer, except: [:index, :new, :create]
  
  
  def index
    @computers = Computer.all
  end
  
  def new
    @computer = Computer.new 
  end
  
  def create
    @computer = Computer.new computer_params
    if @computer.save
      redirect_to computers_path, notice: "Computer Created."
    else
      render :new # update the view 
    end
  end
  
  def edit
    # @computer = Computer.find params[:id]
  end
  
  def update
    # @computer = Computer.find params[:id]
    if @computer.update computer_params
      redirect_to @computer, notice: "Computer Updated."
    else
      render :edit
    end
  end
  
  def destroy
    # @computer = Computer.find params[:id]
    @computer.destroy
    redirect_to @computer, alert: "Computer Deleted."
  end
  
  def show
    # @computer = Computer.find params[:id]
    
  end
  
  private 
  
  def load_computer
    @computer = Computer.find params[:id]
  end
  
  def computer_params
    params.require(:computer).permit(:model,:price,:cpu,:os,:disk,:ram,:screen)
  end
  
end
