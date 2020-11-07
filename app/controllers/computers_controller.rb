class ComputersController < ApplicationController
  
  # call load_computer before every pubice method get called, expect...
  before_action :load_computer, except: [:index, :new, :create]
  before_action :authenticate, except: [:index, :show]
  # before_action :right_person(@computer), except: [:index, :show]
  # stating which HTTP verb and what URL will call that method.
  
  
  # GET - /computers
  def index
    @computers = Computer.all
    # only display current users' computers, this is not we want in this app, every one should be able to see all computers 
    # @computers = current_user.computers
    
  end
  
  # GET - /computers/new
  def new
    @computer = Computer.new 
  end
  
  # POST - /computers
  def create
    @computer = Computer.new computer_params
    @computer.user = current_user
    if @computer.save
      redirect_to computers_path, notice: "Computer Created."
    else
      render :new # update the view 
    end
  end
  
  # GET - /computers/:id/edit
  def edit
    if !right_person(@computer)
       redirect_to root_path, alert: "Invalid Request"
    end
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
    if !right_person(@computer)
       redirect_to root_path, alert: "Invalid Request"
    else
      @computer.destroy
      redirect_to @computer, alert: "Computer Deleted."
    end
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
