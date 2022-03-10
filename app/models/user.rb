class User < ApplicationRecord
  has_secure_password
  enum gender: {female: 'female', male: 'male'}
  enum role: {admin: 'admin', normaluser: 'normaluser'}
  validates :name,  :password, :gender, presence: true
  validates :email, format: { with: /\A[^@,\s]+@[^@,\s]+\.[^@,\s]+\z/, message: "invalid"}, allow_nil: true
end
