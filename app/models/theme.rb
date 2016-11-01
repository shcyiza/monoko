class Theme < ActiveRecord::Base
	has_many :definition_themes
	has_many :definitions, through: :definition_themes
end
