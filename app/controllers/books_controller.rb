class BooksController < ApplicationController
   before_action :require_user_logged_in!, only:[:index,:show]
   before_action :set_book, only:[ "show","edit","update","destroy" ]
  
  def index
      if params[:search_key]
        @books = Book.search(params)
      if params[:name]
       @book.name = params[:name]
     end
      else
        @books = Book.all.order(:name,:auther_name,title: :asc)
      end
   end

   def new
    @book = Book.new
   end

  def show
  end

  def edit
  end

  def create
   @book = Book.new(book_params)
     if @book.save
      flash[:notice] = 'book created successfully'
      redirect_to @book
    else
      render 'new'
    end
  end
  
  def update
     if @book.update(book_params)
      redirect_to(@book)
     else
      render 'edit'
     end
  end

  def destroy
   @book.destroy
    redirect_to books_path
  end

   def set_book
     @book = Book.find(params[:id])
   end

  private
    def book_params
      params.require(:book).permit(:name, :title, :description, :auther_name, :price,:cover, :category_id)
    end
end
