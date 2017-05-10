class Exemple < ActiveRecord::Base
	belongs_to :definition

	belongs_to :contributor, :class_name => "User"
end
