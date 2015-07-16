class Topic < ActiveRecord::Base
  has_many :posts

  validates :title, presence: true
end
