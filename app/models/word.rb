class Word < ActiveRecord::Base

	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

	has_many :definitions, dependent: :destroy
	has_many :definition_translations

	has_many :exemples, dependent: :destroy

	belongs_to :contributor, :class_name => "User"

  scope :in_french, lambda {where(:is_fr => true)}
  scope :in_lingala, lambda {where(:is_li => true)}


  def translations
  	self.definition_translations
  end

	def self.import_file file, contributor

		words = []
		definitions = []
		exemples = []

		spreadsheet = Roo::Spreadsheet.open(file.path)

		(2..spreadsheet.last_row).each do |i|

			row = spreadsheet.row(i)
			words << Word.new(contributor: contributor, name: row[0], prononciation: row[1], is_li: true, imported_file: file.path, imported_row: row)
		end

		Word.import(words)

		(2..spreadsheet.last_row).each do |i|
			row = spreadsheet.row(i)
			word = Word.find_by(name: row[0])
			# create the definitions in french
			if row[2] != nil
				definitions  << Definition.new(contributor: contributor, word: word, content: row[2], is_fr: true, imported_file: file.path, imported_row: row)
			end

			# create the definitions in english
			if row[3] != nil
				definitions << Definition.new(contributor: contributor, word: word, content: row[3], is_en: true, imported_file: file.path, imported_row: row)
			end

			# create exemples
			if row[4] != nil
				exemples << Exemple.new(contributor: contributor, word: word, content: row[4], is_li: true, imported_file: file.path, imported_row: row)
			end

			# create the definitions in ligala
			if row[5] != nil
				definitions << Definition.new( contributor: contributor, word: word, content: row[5], is_li: true, imported_file: file.path, imported_row: row)
			end
		end

		Exemple.import(exemples)
		Definition.import(definitions)

	end

end
