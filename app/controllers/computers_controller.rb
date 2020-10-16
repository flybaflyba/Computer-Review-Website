class ComputersController < ApplicationController
  
  # call load_computer before every pubice method get called, expect...
  before_action :load_computer, except: [:index, :new, :create]
  
  # stating which HTTP verb and what URL will call that method.
  
  
  # GET - /computers
  def index
    @computers = Computer.all
  end
  
  # GET - /computers/new
  def new
    @computer = Computer.new 
  end
  
  # POST - /computers
  def create
    @computer = Computer.new computer_params
    if @computer.save
      redirect_to computers_path, notice: "Computer Created."
    else
      render :new # update the view 
    end
  end
  
  # GET - /computers/:id/edit
  def edit
    # @computer = Computer.find params[:id]
  end
  
  # PATCH/PUT - /computers/:id
  def update
    # @computer = Computer.find params[:id]
    if @computer.update computer_params
      redirect_to @computer, notice: "Computer Updated."
    else
      render :edit
    end
  end
  
  # DELETE - /computers/:id
  def destroy
    # @computer = Computer.find params[:id]
    @computer.destroy
    redirect_to @computer, alert: "Computer Deleted."
  end
  
  # GET - /computers/:id
  def show
    # @computer = Computer.find params[:id]
    @review = Review.new
    
    
  end
  
  private 
  
  def load_computer
    @computer = Computer.find params[:id]
  end
  
  def computer_params
    params.require(:computer).permit(:model,:price,:cpu,:os,:disk,:ram,:screen)
  end
  
end
