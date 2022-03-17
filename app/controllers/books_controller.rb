class BooksController < ApplicationController
   before_action :require_user_logged_in!
   before_action :set_book, only:[ "show","edit","update","destroy" ]
  
  def index
    @books =Book.order(params[:sort])
      if params[:search_key]
        @books = Book.search(params)
      if params[:name]
       @book.name = params[:name]
     end
      else
        @books = Book.all.order(:name,:auther_name,:title,:description)
     end
   end
  # def index
  #   @books = Book.order(:name)
  #   if params[:order] == 'name'
  #       @books = Book.all.order('name')
  #   elsif params[:order] == 'auther_name'
  #       @books = Book.all.order('auther_name')
  #   elsif params[:order] == 'title'
  #       @books = Book.all.order('title')
  #   else
  #       @books = Book.all
  #   end 

  #  end

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
