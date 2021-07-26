class BooksController < ApplicationController
  before_action :set_book, only: %i[update destroy show]
  before_action :authenticated, only: %i[wishlist history create update destroy]
  before_action :authorize_book, only: %i[edit update destroy]

  def index
    # render json: Book.all.order(id: :asc), status: :ok
    @home_book = Book.all.order(id: :asc).first(30)
    @home_books = @home_book.map do |book|
      begin
        book = { id: book.id, title: book.title, author: book.author, year: book.year, genre: book.genre, status: book.status, :image => book.bookimage.service_url }
      rescue => exception
        book = { id: book.id, title: book.title, author: book.author, year: book.year, genre: book.genre, status: book.status, :image => "https://edit.org/images/cat/book-covers-big-2019101610.jpg" }
      end
      book
    end
    render json: @home_books
  end

  def wishlist
    # render json: current_user.books.where(status: "unread")
    @wishlist_book = current_user.books.where(status: "unread")
    @wishlist_books = @wishlist_book.map do |book|
      begin
        book = { id: book.id, title: book.title, author: book.author, year: book.year, genre: book.genre, status: book.status, :image => book.bookimage.service_url }
      rescue => exception
        book = { id: book.id, title: book.title, author: book.author, year: book.year, genre: book.genre, status: book.status, :image => "https://edit.org/images/cat/book-covers-big-2019101610.jpg" }
      end
      book
    end
    render json: @wishlist_books
  end

  # need to change status to read
  def history
    @history_book = current_user.books.where(status: "read")
    @history_books = @history_book.map do |book|
      begin
        book = { id: book.id, title: book.title, author: book.author, year: book.year, genre: book.genre, status: book.status, :image => book.bookimage.service_url }
      rescue => exception
        book = { id: book.id, title: book.title, author: book.author, year: book.year, genre: book.genre, status: book.status, :image => "https://edit.org/images/cat/book-covers-big-2019101610.jpg" }
      end
      book
    end
    render json: @history_books, include: [:review], status: :ok
  end

  # show method
  def show
    begin
      @show_book = {user_id: @book.user_id, id: @book.id, title: @book.title, author: @book.author, year: @book.year, genre: @book.genre, status: @book.status, image: @book.bookimage.service_url, review: @book.review.as_json}
    rescue => exception
      @show_book = {user_id: @book.user_id, id: @book.id, title: @book.title, author: @book.author, year: @book.year, genre: @book.genre, status: @book.status, image: 'https://edit.org/images/cat/book-covers-big-2019101610.jpg', review: @book.review.as_json}
    end
    render json: @show_book, include: [:review], status: :ok
    # render json: @book, include: [:review], status: :ok
    # render json: @book, status: :ok
  end

  # @book.bookimage.service_url

  def create
    @book = current_user.books.new(book_params)
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
    params.permit(:id, :author, :title, :year, :genre, :status, :user_id, :bookimage)
  end

  def authorize_book
    begin
      @book = current_user.books.find_by_id(params[:id])

      return @book
    rescue => exception
      render status: :unprocessable_entity
      flash[:alert] = "You do not have permissions to access this page"
    end
    # redirect_to listings_path
  end
end
