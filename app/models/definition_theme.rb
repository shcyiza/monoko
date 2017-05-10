class DefinitionTheme < ActiveRecord::Base
	belongs_to :definition 
	belongs_to :theme 

	belongs_to :contributor, :class_name => "User"

	def name
		theme.name
	end
end
