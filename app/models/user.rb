class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  acts_as_reader
  has_many :posts, dependent: :destroy

  validates :first_name, :last_name, :birthday, presence: true
  validates :first_name, :last_name, length: { maximum: 50 }

  def name
    [first_name, last_name].join ' '
  end
end
