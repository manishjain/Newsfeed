class User < ActiveRecord::Base
	# attr_accessor :name, :email
	before_save { self.email = email.downcase }
	has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
	validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 }, uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6 }
  
  # def feed
  #   # Post.where("user_id = ?", id)
  #   Post.all
  # end

end
