class ComputersController < ApplicationController
  def index
    @computers = Computer.all
  end
  
  def new
    @computer = Computer.new
  end
end
