class Post < ActiveRecord::Base
  validates :title, presence: true, length: { maximum: 100 }
  validates :body, presence: true

  default_scope { order('created_at DESC') }

  has_attached_file :photo,
                    url: '/assets/media/images/:id/:style/:basename.:extension',
                    path: ':rails_root/public/assets/media/images/:id/:style/:basename.:extension'
  validates_attachment_size :photo, less_than: 10.megabytes
  validates_attachment :photo, content_type: {
    content_type: [
      'image/jpg',
      'image/jpeg',
      'image/png',
      'image/gif'
    ]
  }

  def older
    self.class.where('id > ?', id).first
  end

  def newer
    self.class.where('id < ?', id).last
  end
end
