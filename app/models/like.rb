class Like < ActiveRecord::Base
	# enum target_type: [ :post, :comment ]
	belongs_to :user
	belongs_to :post, -> { where(target_type: 'post') }, foreign_key: "target_id"
	belongs_to :comment, -> { where(target_type: 'comment') }, foreign_key: "target_id"
	validates :target_id, presence: true
	validates :target_type, presence: true
	validates :user_id, presence: true
end
