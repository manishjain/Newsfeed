class Post < ActiveRecord::Base
	belongs_to :user
	validates :content, length: { maximum: 500 }, presence: true
end
