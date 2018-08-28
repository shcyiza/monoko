class Definition < ActiveRecord::Base
	belongs_to :word
	has_many :definition_themes, dependent: :destroy
	has_many :themes, through: :definition_themes

	has_many :definition_groups, dependent: :destroy
	has_many :groups, through: :definition_groups

	has_many :definition_translations, dependent: :destroy

	belongs_to :contributor, :class_name => "User"
  validates :content, presence: true

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
    translation = self.translations.joins(:word).where('words.is_fr = ?', true).first
    if translation
      return translation.word
    end
  end

  def in_en
    translation = self.translations.joins(:word).where('words.is_en = ?', true).first
    if translation
      return translation.word
    end
  end


  def self.import_updates file, contributor

    definitions = []

    spreadsheet = Roo::Spreadsheet.open(file.path)

    (2..spreadsheet.last_row).each do |i|

      row = spreadsheet.row(i)
      definition = nil
      if row[2]

        definition = Definition.find(row[2])
        if row[3] == 1
          # destroy definition if requested
          definition.destroy
        elsif definition.content != row[4]
          # modify definition data
          definition.update(content: row[4])
        end

      elsif row[0] && row[4]
        definitions << Definition.new(word_id: row[0], is_li: true, content: row[4], contributor: contributor)
      end

    end

    Definition.import(definitions)

  end

end
