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
    @definitions = Definition.all.page(params[:page])
  end

  def admin_words
    @words = Word.all.order('name ASC').where.not(name: [nil, '']).page(params[:page])
    @all_words = Word.all.order('name ASC').where.not(name: [nil, ''])
    @timestamp = "admin_export_#{Time.now.strftime("%d%m%Y%H%M%S")}"
    respond_to do |format|
      format.html
      format.xlsx {
        response.headers["Content-Disposition"] = "attachment; filename='#{@timestamp}.xlsx'"
      }
    end
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
