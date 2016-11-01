class Group < ActiveRecord::Base
	has_many :definition_groups
	has_many :definitions, through: :definition_groups

	def title
		if definitions.any?
			"#{definitions.last.word.name}..."
		end
	end
end
