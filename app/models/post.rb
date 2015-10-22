class Post < ActiveRecord::Base
  validates :title, presence: true, length: { maximum: 100 }
  validates :body, presence: true

  default_scope { order('created_at DESC') }

  has_attached_file :photo
  validates_attachment :photo, content_type: {
    content_type: [
        "image/jpg",
        "image/jpeg",
        "image/png",
        "image/gif"
    ]
  }

  def older
    self.class.where("id > ?", id).first
  end

  def newer
    self.class.where("id < ?", id).last
  end
end
