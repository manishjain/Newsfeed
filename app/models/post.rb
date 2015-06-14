class Post < ActiveRecord::Base
	belongs_to :user
	default_scope -> { order(updated_at: :desc) }
	validates :user_id, presence: true
	validates :content, length: { maximum: 200 }, presence: true
	has_many :likes, -> { where(target_type: 'post') },  :foreign_key => :target_id
	has_many :comments, -> { where(target_type: 'comment') },  :foreign_key => :target_id

	def self.getFeed
		Post.all
	end
end
