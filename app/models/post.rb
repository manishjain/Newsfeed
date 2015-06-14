class Post < ActiveRecord::Base
	belongs_to :user
	default_scope -> { order(updated_at: :desc) }
	validates :user_id, presence: true
	validates :content, length: { maximum: 200 }, presence: true
	has_many :likes, -> { where(target_type: 'post') },  :foreign_key => :target_id, dependent: :destroy
	has_many :users, through: :likes
	has_many :comments, -> { where(target_type: 'comment') },  :foreign_key => :target_id

	def self.getFeed
		Post.includes(:likes, :users)
	end
	
	def liked_by user
		if(users.include?(user))
			true
		else
			false
		end
	end

	def get_liked_by user
		likes.where(user: user).first
	end

end
