class BlogPost < ApplicationRecord
	validates :title, :entry, :codetype, presence: true
	validates :title, uniqueness: true, length: {maximum: 45}
	has_many :comments
	belongs_to :user

	def answered
		a2 = []
		self.comments.each do |search|
			if search.rating == 1
				a2.push(search.rating)
			end
		end

		if a2.size > 0
			return true
		else
			return false
		end

	end
end
