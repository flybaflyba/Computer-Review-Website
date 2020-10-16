class ReviewsController < ApplicationController
  
  before_action :load_computer
  before_action :load_review, except:[:index, :new, :create]
  
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
      redirect_to computer_path(@computer), notice: "Review Created."
    else 
      render :new
    end
  end
  
  def show
    # @review = @computer.reviews.find params[:id]
  end
  
  def edit 
  end
  
  def update  
    if @review.update review_params
      redirect_to [@computer], notice: "Review Updated."
    else 
      render :edit
    end
  end
  
  def destroy  
    @review.destroy
    redirect_to computer_path(@computer)
  end
  
  private 
  
  def load_computer 
    @computer = Computer.find params[:computer_id] # /computers/3/reviews  
  end
  
  def load_review
    @review = @computer.reviews.find params[:id] # load all reviews of that computer 
  end
  
  def review_params
    params.require(:review).permit(:content,:score)
  end
  
end
