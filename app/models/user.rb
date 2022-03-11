class User < ApplicationRecord
  has_secure_password

  # callback
  before_create :normal_user

  # enum
  enum gender: {female: 'female', male: 'male'}
  enum role: {admin: 'admin', normaluser: 'normaluser'}
  
  # validation
  validates :name, :gender, presence: true
  validates :password, presence: true, if: Proc.new { |user| user.password.present? }, confirmation: true, on: :update
  validates :email, format: { with: /\A[^@,\s]+@[^@,\s]+\.[^@,\s]+\z/, message: "invalid"}, allow_nil: true

  # scope
  scope :search, ->(params) {where("name LIKE ? OR email LIKE ?", 
        "%#{params[:search_key]}%", "%#{params[:search_key]}%")}

  def normal_user
    self.role = 'normaluser'
  end
end
