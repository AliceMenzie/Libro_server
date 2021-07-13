class BooksController < ApplicationController

    def index 
        render json: Book.all
    end 

    def create
    @book = Book.new(book_params)
    end 

    private 

def book_params
 params.require(:book).permit(:author, :title, :year, :status, :genre)
end 

end
