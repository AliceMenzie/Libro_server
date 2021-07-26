class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :update, :destroy]
  before_action :set_book, only: [:create]

  # GET /reviews
  def index
    @reviews = Review.all

    render json: @reviews, status: :ok
  end

  # GET /reviews/1
  def show
    render json: @review
  end

  # POST /reviews
  def create
    @review = @book.create_review(review_params)

    # if @review.save
    render json: @review, status: :created, location: @review
    # else
    #   render json: @review.errors, status: :unprocessable_entity
    # end
  end

  # PATCH/PUT /reviews/1
  def update
    if @review.update(review_params)
      render json: @review
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reviews/1
  def destroy
    @review.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_review
    @review = Book.find(params[:id]).review
  end

  # Only allow a trusted parameter "white list" through.
  def review_params
    params.require(:review).permit(:description, :rating, :book_id)
  end
end

def set_book
  @book = Book.find(review_params[:book_id])
end
