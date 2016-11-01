class Word < ActiveRecord::Base
	has_many :definitions

    scope :in_french, lambda {where(:is_fr => true)}
    scope :in_lingala, lambda {where(:is_li => true)}
end
