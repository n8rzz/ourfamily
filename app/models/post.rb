class Post < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true, length: { maximum: 100 }
  validates :body, presence: true

  default_scope { order('created_at DESC') }

  has_attached_file :photo,
                    styles: {
                      medium: '400x400>',
                      thumb: '100x100>'
                    },
                    url: ':s3_domain_url',
                    path: '/post_attachments/:id/:style/:basename.:extension'
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
