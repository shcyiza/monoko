class DefinitionTranslation < ActiveRecord::Base
	belongs_to :definition 
	belongs_to :word

	def name
		definition.name
	end
end
