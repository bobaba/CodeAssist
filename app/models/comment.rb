class Comment < ApplicationRecord
	belongs_to :blog_post, dependent: :destroy
	validates :entry, :blog_post_id, :codetype, presence: true
	belongs_to :user

	def codeType(type, what)
		case type
		when "CSS"
			CodeRay.scan(what, :css).div(:line_numbers => :table).html_safe
		when "HTML"
			CodeRay.scan(what, :html).div(:line_numbers => :table).html_safe
		when "Ruby"
			CodeRay.scan(what, :ruby).div(:line_numbers => :table).html_safe
		when "ERB"
			CodeRay.scan(what, :erb).div(:line_numbers => :table).html_safe
		when "JavaScript"
			CodeRay.scan(what, :javascript).div(:line_numbers => :table).html_safe
		end

	end

end
