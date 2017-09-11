class Answers < ActiveRecord::Base
  has_many :title
  belongs_to :user
end
