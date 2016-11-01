class Definition < ActiveRecord::Base
	belongs_to :word
	has_many :definition_themes
	has_many :themes, through: :definition_themes
	has_many :exemples
	has_many :definition_groups
	has_many :groups, through: :definition_groups
	has_many :definition_translations


	def name
		word.name
	end

	def associated_definitions
		groups.each do |group|
			group.definitions.each do |definition|
				definition.name
			end
		end
	end

	def translations
    	self.definition_translations
    end
end
