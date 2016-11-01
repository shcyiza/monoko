class DefinitionTheme < ActiveRecord::Base
	belongs_to :definition 
	belongs_to :theme 
end
