class Book < ApplicationRecord
  has_one_attached :cover
  
  # Association
  belongs_to :category

  # Validation
  validates :name, :title, :description, :auther_name, presence: true, length: { minimum: 3 }
  validates :price,  :format => { :with => /\A(\$)?(\d+)(\.|,)?\d{0,2}?\z/ },:numericality => {:greater_than => 0, :less_than => 1000}

  scope :search, ->(params) {where("name LIKE ? OR description LIKE ?", 
        "%#{params[:search_key]}%", "%#{params[:search_key]}%")}
end
