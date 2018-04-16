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

	def self.import file, contributor
		spreadsheet = Roo::Spreadsheet.open(file.path)
		(2..spreadsheet.last_row).each do |i|

			row = spreadsheet.row(i)
			word = Word.new(contributor: contributor, name: row[0], prononciation: row[1], is_li: true)

			if word.save
				# create the definitions in french
				if row[2] != nil
					Definition.create!(contributor: contributor, word: word, content: row[2], is_fr: true)
				end

				# create the definitions in english
				if row[3] != nil
					Definition.create!(contributor: contributor, word: word, content: row[3], is_en: true)
				end

				# create exemples
				if row[4] != nil
					Exemple.create!(contributor: contributor, word: word, content: row[4], is_li: true)
				end

				# create the definitions in ligala
				if row[5] != nil
					Definition.create!( contributor: contributor, word: word, content: row[5], is_en: true)
				end
			end

		end
	end

end
