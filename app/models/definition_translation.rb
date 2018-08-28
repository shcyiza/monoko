class DefinitionTranslation < ActiveRecord::Base
	belongs_to :definition 
	belongs_to :word
	belongs_to :contributor, class_name: "User"

  validates :definition, uniqueness: { scope: :word }

	scope :by_words, -> { includes(:word).order('words.name') }

	def name
		definition.name
	end

	def self.import_updates file, contributor
		# the goal of those array is to able to create words
		# and multiple many to manny relations
		# between eache of word and their corresponding defintions
		translated_ids = []
		translations = []
		word = []
		definitions_translation = []

		spreadsheet = Roo::Spreadsheet.open(file.path)

		(2..spreadsheet.last_row).each do |i|

			row = spreadsheet.row(i)
			def_trans = nil

			if row[0]
				def_trans = DefinitionTranslation.find(row[0])
				if row[1] == 1
					def_trans.destroy
				end
				# create a new definiton_translation
			elsif row[2] && row[4]
				if DefinitionTranslation.find_by(word_id: row[2], defintion_id: row[6]) == nil
					definitions_translation << DefinitionTranslation.new(word_id: row[2], defintion_id: row[6])
				end
			end

			if row[2] == nil && row[3] && row[6]

				translated_ids << row[6]

				if spreadsheet.row((i-1))[3] != row[3]
					translations << Word.new(name: row[3], is_fr: row[4], is_en: row[5])
					word << Word.new(name: row[3], is_fr: row[4], is_en: row[5], contributor: contributor)
				elsif spreadsheet.row((i-1))[3] == row[3]
					translations << Word.new(name: row[3], is_fr: row[4], is_en: row[5])
				end

			end

		end

		Word.import(word)

		translated_ids.each do |_id|
			# When a new translation must be created
			# I add the created translation and the cooresponding definition
			# in two different array at the same time
			# because of that they have the same index
			# So I can call the definition from the index of translation
			# and vise versa... Tada! Magic is done
			translated = Definition.find(_id)
			found_translation = translations[translated_ids.index(_id)]
			translation = Word.find_by(name: found_translation.name)
			unless DefinitionTranslation.where(definition: translated, word: translation).any?
				definitions_translation << DefinitionTranslation.new(definition: translated, word: translation)
			end
		end

		DefinitionTranslation.import(definitions_translation)

	end
end
