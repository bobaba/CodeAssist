class BlogPost < ApplicationRecord
	validates :title, :entry, presence: true
	validates :title, uniqueness: true, length: {maximum: 250}
	has_many :comments
	belongs_to :user

	def getWordCount(countWhat)
		store = countWhat
		storeArr = store.split(" ")
		return storeArr.size
	end

	def longShort(countWhat)
		store = countWhat
		storeArr = store.split(" ")
		answer = ""
		if storeArr.size > 500
			answer = "Long Read"
		else
			answer = "Quick Read"
		end
		return answer
	end
end
