class Comment < ActiveRecord::Base
	# enum target_type: [ :post, :comment ]
	belongs_to :user
	default_scope -> { order(updated_at: :desc) }
	belongs_to :post, -> { where(target_type: 'post') }, foreign_key: "target_id"
	belongs_to :comment, -> { where(target_type: 'comment') }, foreign_key: "target_id"
	validates :target_id, presence: true
	validates :target_type, presence: true
	validates :user_id, presence: true
	validates :content, length: { maximum: 200 }, presence: true
	has_many :comments, -> { where(target_type: 'comment') },  :foreign_key => :target_id
	has_many :likes, -> { where(target_type: 'comment') },  :foreign_key => :target_id, dependent: :destroy
	has_many :users, through: :likes


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
