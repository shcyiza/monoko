class DefinitionTranslation < ActiveRecord::Base
	belongs_to :definition 
	belongs_to :word

	belongs_to :contributor, class_name: "User"

	def name
		definition.name
	end
end
