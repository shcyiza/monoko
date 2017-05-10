class Word < ActiveRecord::Base
	has_many :definitions
	has_many :definition_translations

	belongs_to :contributor, :class_name => "User"

    scope :in_french, lambda {where(:is_fr => true)}
    scope :in_lingala, lambda {where(:is_li => true)}


    def translations
    	self.definition_translations
    end
end
