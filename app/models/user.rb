class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    has_many :skills
    has_many :themes, through: :skills

    has_many :words, :foreign_key => "contributor_id"
    has_many :themes, :foreign_key => "contributor_id"
    has_many :groups, :foreign_key => "contributor_id"
    has_many :exemples, :foreign_key => "contributor_id"
    has_many :definitions, :foreign_key => "contributor_id"
    has_many :definition_translations, :foreign_key => "contributor_id"
    has_many :definition_themes, :foreign_key => "contributor_id"
    has_many :definition_groups, :foreign_key => "contributor_id"

    def full_name
      "#{first_name} #{last_name}"
    end

    def translations
      definition_translations
    end

    def name_or_placeholder
      if full_name.present?
        full_name
      else
        email.split("@")[0]
      end
    end

    def associations
      definition_groups
    end

    def contributions_count
      words.count + definitions.count + translations.count + themes.count + associations.count 
    end


end
