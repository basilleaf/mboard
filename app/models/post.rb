class Post < ActiveRecord::Base
  belongs_to :user
  attr_accessible :content, :title, :user_id
  validates :content, :presence => true
  validates :title, :presence => true
end
