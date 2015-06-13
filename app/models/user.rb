class User < ActiveRecord::Base
	# attr_accessor :name, :email
	before_save { self.email = email.downcase }
	has_many :posts, dependent: :destroy
	validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 }, uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6 }
end
