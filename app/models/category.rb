class Category < ApplicationRecord
  has_many :books
  scope :search, ->(params) {where("name LIKE ? OR email LIKE ?", 
        "%#{params[:search_key]}%", "%#{params[:search_key]}%")}
end
