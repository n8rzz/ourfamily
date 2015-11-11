class Post < ActiveRecord::Base
  acts_as_readable :on => :created_at
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
                    path: '/images/:id/:style/:basename.:extension'
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

  def seen_by_all?
    if User.have_not_read(self).map(&:name).length == 0
      @seen_by_all = true
    else
      @seen_by_all = false
    end
  end
end
