class Theme < ActiveRecord::Base
	has_many :definition_themes
	has_many :definitions, through: :definition_themes

	belongs_to :contributor, :class_name => "User"
end
