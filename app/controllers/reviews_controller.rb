class ReviewsController < ApplicationController
  
  before_action :load_computer
  
  def index
    # @computer = Computer.find params[:computer_id] # /computers/3/reviews
    @reviews = @computer.reviews
  end
  
  def new 
    @review = Review.new
  end
  
  def create 
    @review = Review.new review_params
    @review.computer = @computer
    if @computer.reviews << @review 
      redirect_to computer_reviews_path(@computer), notice: "Review Created."
    else 
      render :new
    end
  end
  
   def show
    @review = @computer.reviews.find params[:id]
  end
  
  
  
  private 
  
  def load_computer 
    @computer = Computer.find params[:computer_id] # /computers/3/reviews  
  end
  
  def review_params
    params.require(:review).permit(:content,:score)
  end
  
end
