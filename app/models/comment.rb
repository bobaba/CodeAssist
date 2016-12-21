class Comment < ApplicationRecord
	belongs_to :blog_post, dependent: :destroy
	validates :entry, :blog_post_id, presence: true
	belongs_to :user
end
