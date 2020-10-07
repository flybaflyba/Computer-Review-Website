class ComputersController < ApplicationController
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
  
  private 
  
  def computer_params
    params.require(:computer).permit(:model,:price,:cpu,:os,:disk,:ram,:screen)
  end
  
end
