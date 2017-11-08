class ReviewsController < ApplicationController
  before_action :set_restaurant, only: [:create]

  def create
    # POST /restaurants/:restaurant_id/reviews
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant), notice: 'Review was successfully saved.'
    else
      render :new
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
