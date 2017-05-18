class Word < ActiveRecord::Base

	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

	has_many :definitions, dependent: :destroy
	has_many :definition_translations

	belongs_to :contributor, :class_name => "User"

    scope :in_french, lambda {where(:is_fr => true)}
    scope :in_lingala, lambda {where(:is_li => true)}


    def translations
    	self.definition_translations
    end
end
