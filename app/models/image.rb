class Image < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true, length: { maximum: 100 }
  validates :description, presence: true

  default_scope { order('created_at DESC') }

  has_attached_file :attachment,
                    styles: {
                      medium: '400x400>',
                      thumb: '100x100>'
                    },
                    url: ':s3_domain_url',
                    path: '/images/:id/:style/:basename.:extension'
  validates_attachment_size :attachment, less_than: 10.megabytes
  validates_attachment :attachment,
                       # presence: true,
                       content_type: {
                         content_type: [
                           'image/jpg',
                           'image/jpeg',
                           'image/png',
                           'image/gif'
                         ]
                       }
end
