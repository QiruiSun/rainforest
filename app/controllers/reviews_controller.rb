class ReviewsController < ApplicationController


  before_action :ensure_logged_in, only: [:create, :destroy]
  before_action :load_product
  def show
    @reivew = Review.find(params[:id])
  end

  def create
    @review = @product.reviews.build(reviews_params)
    @review.user = current_user
      if @review.save
        redirect_to products_path, notice: "Review created!"
      else
        flash[:alert] = "Invalid input"
        render :new
      end

  end

  def destroy
    @review = Reivew.find(params[:id])
    @review.destroy
  end

  def reviews_params
    params.require(:review).permit(:comment, :product_id)
  end

  def load_product
    @product = Product.find(params[:product_id])

  end

end
