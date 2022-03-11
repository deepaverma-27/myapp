class PagesController < ApplicationController
  def index
      redirect_to books_url
   end
end
