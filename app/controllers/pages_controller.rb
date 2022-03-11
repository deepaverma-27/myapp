class PagesController < ApplicationController
   def index
    if @current_user.present? && @current_user.normaluser? 
      redirect_to books_url
    end
  end
end
