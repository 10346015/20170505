class BooksController < ApplicationController
  def index
    @books = Book.all
  end
  
  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_parms)
    
    if @book.save
      redirect_to books_path
    else
      renden 'new'
    end
  end
  
  
  
  private
    def book_parms
      params.require("book").permit(:name,:content,:author,:price)
    end
   

end
