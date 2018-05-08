class Exemple < ActiveRecord::Base
	belongs_to :word

	belongs_to :contributor, :class_name => "User"

end
