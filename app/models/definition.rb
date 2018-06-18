class Definition < ActiveRecord::Base
	belongs_to :word
	has_many :definition_themes, dependent: :destroy
	has_many :themes, through: :definition_themes

	has_many :definition_groups, dependent: :destroy
	has_many :groups, through: :definition_groups

	has_many :definition_translations, dependent: :destroy

	belongs_to :contributor, :class_name => "User"

	scope :by_words, -> { includes(:word).order('words.name') }

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

  def in_fr
    self.translations.joins(:word).where('words.is_fr = ?', true).first
  end

  def in_en
    self.translations.joins(:word).where('words.is_en = ?', true).first
  end


  def self.import_updates file, contributor

    translated_defs = []
    translations = []
    definitions_translation = []

    spreadsheet = Roo::Spreadsheet.open(file.path)

    (2..spreadsheet.last_row).each do |i|

      row = spreadsheet.row(i)
      definition = nil
      if row[2]
        definition = Definition.find(row[2])
      else
        definition = Definition.create(word_id: row[0], is_li: true, content: row[4])
      end
      # create the definitions in french
      if row[3] == 1
        definition.destroy
      else

        # modify definition data
        if definition.content != row[4]
          definition.update(content: row[4])
        end

        # create or modifying the translations in french
        if definition.in_fr
          if definition.in_fr != row[5]
            definition.in_fr.word.update(name: row[5])
          end
        elsif row[5] != nil
          # preapring some magic, I put the translated definition in a array
          # at the same time that i put the translation in the array ready to be exported
          # So they have the same index... see line
          translated_defs << definition.content
          translations << Word.new(contributor: contributor, name: row[5], is_fr: true, imported_file: file.path, imported_row: row)
        end

        # create or modifying the translations in english
        if definition.in_en
          if definition.in_en != row[6]
            definition.in_fr.word.update(name: row[6])
          end
        elsif row[6] != nil
          #see line 68
          translated_defs << definition.content
          translations << Word.new(contributor: contributor, name: row[6], is_en: true, imported_file: file.path, imported_row: row)
        end

      end
    end

    Word.import(translations)

    translated_defs.each do |definition|
      # Since they have the same index I can call the translated from the translation
      # and vise versa... Tada! Magic is done
      translated = Definition.find_by(content: definition)
      find_translation = translations[translated_defs.index(definition)]
      translation = Word.find_by(name: find_translation.name)
      unless DefinitionTranslation.where(definition: translated, word: translation).any?
        definitions_translation << DefinitionTranslation.new(definition: translated, word: translation)
      end
    end

    DefinitionTranslation.import(definitions_translation)

  end

end
