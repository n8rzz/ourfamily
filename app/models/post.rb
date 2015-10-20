class Post < ActiveRecord::Base
  validates :title, presence: true, length: { maximum: 100 }
  validates :body, presence: true
end
