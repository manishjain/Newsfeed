class Post < ActiveRecord::Base
	belongs_to :user
	default_scope -> { order(updated_at: :desc) }
	validates :user_id, presence: true
	validates :content, length: { maximum: 200 }, presence: true

	def self.getFeed
		Post.all
	end
end
