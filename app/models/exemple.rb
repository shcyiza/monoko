class Exemple < ActiveRecord::Base
	belongs_to :word
	belongs_to :definition
	belongs_to :contributor, :class_name => "User"

	def self.change_definition_id_to_word
		Exemple.all.each do |eg|
			word = eg.definition.word
			eg.update(definition_id: word.id)
		end
	end

end
