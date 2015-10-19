class Post < ActiveRecord::Base
  validates :title, presence: true, length: { maximum: 50 }
  validates :body, presence: true
end
