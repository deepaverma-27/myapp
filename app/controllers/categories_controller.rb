class CategoriesController < ApplicationController
  def index
    if params[:search_key]
      @categories =Category.search(params)
    else
      @categories =Category.all
     end
  end
  
  def new
    @category = Category.new
  end

  def show
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = 'created successfully'
      redirect_to @category
    else
      render 'new'
    end
  end

  def category_params
     params.require(:category).permit(:name)
  end
end