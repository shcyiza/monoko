class DefinitionTranslation < ActiveRecord::Base
	belongs_to :definition 
	belongs_to :word
	belongs_to :contributor, class_name: "User"

  validates :definition, uniqueness: { scope: :word }

	def name
		definition.name
	end
end
