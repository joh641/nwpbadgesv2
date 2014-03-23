class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :name

  has_many :submissions
  has_many :badges, through: :submissions

  validates :name, :presence => true


  USER = 0
  ADMIN = 1

  def admin?
    category == ADMIN
  end

end
