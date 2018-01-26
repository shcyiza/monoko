class PagesController < ApplicationController
  


  def home
    @search = Search.new
  end

  def about
  end

  def contact
  end

  def team
  end

  def terms
  end

  def admin
    @users = User.all
  end

  def admin_definitions
    @definitions = Definition.all
  end

  def admin_words
    @words = Word.all.where.not(name: [nil, '']).page(params[:page])
  end

  def admin_translations
    @translations = DefinitionTranslation.all
  end


  def admin_definitions_themes
    @labelisations = DefinitionTheme.all
  end

  def admin_themes
    @themes = Theme.all
  end

  def admin_groups
    @groups = Group.all
  end

  def admin_definitions_groups
    @associations = DefinitionGroup.all
  end

  def admin_searches
    @searches = Search.order('created_at DESC')
  end
end
