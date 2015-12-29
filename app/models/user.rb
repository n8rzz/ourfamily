class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lastseenable

  has_many :posts, dependent: :destroy
  has_many :images, dependent: :destroy

  validates :first_name, :last_name, :birthday, presence: true
  validates :first_name, :last_name, length: { maximum: 50 }

  def name
    [first_name, last_name].join ' '
  end
end
