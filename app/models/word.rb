class Word < ActiveRecord::Base
	has_many :definitions
	has_many :definition_translations

    scope :in_french, lambda {where(:is_fr => true)}
    scope :in_lingala, lambda {where(:is_li => true)}


    def translations
    	self.definition_translations
    end
end
