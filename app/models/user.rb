class User < ActiveRecord::Base
  validates_presence_of :username, :email
  has_secure_password
  has_many :questions
  has_many :answers
  has_many :title, through: :questions
  has_many :title, through: :answers
end
