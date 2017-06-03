class Definition < ActiveRecord::Base
	belongs_to :word
	has_many :definition_themes, dependent: :destroy
	has_many :themes, through: :definition_themes
	has_many :exemples, dependent: :destroy
	
	has_many :definition_groups, dependent: :destroy
	has_many :groups, through: :definition_groups
	
	has_many :definition_translations, dependent: :destroy

	belongs_to :contributor, :class_name => "User"


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
