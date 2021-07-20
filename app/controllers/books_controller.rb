class BooksController < ApplicationController
  before_action :set_book, only: %i[update destroy show]
  before_action :authenticated

  def index
    render json: Book.all.order(id: :asc)
  end

  def wishlist
    render json: current_user.books.where(status: "unread")
  end

  # need to change status to read
  def history
    render json: current_user.books.where(status: "read")
  end

  # show method
  def show
    render json: @book, include: [:review], status: :ok
    # render json: @book, status: :ok
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      render json: @book, status: :created
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  def update
    # @book = Book.find(params[:id])
    if @book.update(book_params)
      render json: @book, status: :ok
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @book.destroy
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:author, :title, :year, :genre, :status, :user_id)
  end
end
