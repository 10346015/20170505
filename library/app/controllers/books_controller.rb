class BooksController < ApplicationController
  
  before_action :find_book, only:[:show,:edit,:update]
  
  def index
    @books = Book.all
  end
  
  def new
    @book = Book.new
  end
  
  def show
    
  end
  
  def create
    @book = Book.new(book_parms)
    
    if @book.save
      redirect_to books_path
    else
      renden 'new'
    end
  end
  
  def edit
    
  end
  
  def update
    if  @book.update(book_parms)
     redirect_to books_path , notice: "updated!"
   else
     render 'edit'
   end

  end
  
  
  private
    def book_parms
      params.require("book").permit(:name,:content,:author,:price)
    end
   
  def find_book
   @book = Book.find_by(id: params[:id])
   redirect_to books_path , notice: "no data!" if @book.nil?
 end

end
