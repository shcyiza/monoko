class DefinitionGroup < ActiveRecord::Base
	belongs_to :definition 
	belongs_to :group
end
