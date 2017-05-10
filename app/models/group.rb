class Group < ActiveRecord::Base
	has_many :definition_groups
	has_many :definitions, through: :definition_groups

	belongs_to :contributor, :class_name => "User"

	def title
		if definitions.any?
			"#{definitions.last.word.name}..."
		end
	end
end
