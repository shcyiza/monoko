class DefinitionGroup < ActiveRecord::Base
	belongs_to :definition 
	belongs_to :group

	belongs_to :contributor, :class_name => "User"
end
