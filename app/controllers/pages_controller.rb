# frozen_string_literal: true
class PagesController < ApplicationController

  def about; end

  def contact; end

  def team; end

  def terms; end

  def admin
    @users = User.all
  end

  def admin_definitions
    @definitions = Definition.by_words.page(params[:page])
    @total_export_page = Definition.by_words.page(params[:page]).per(400).total_pages
  end

  def admin_words
    @words = Word.all.order('name ASC').where.not(name: [nil, '']).page(params[:page])
    @total_export_page = Word.all.order('name ASC').where.not(name: [nil, '']).page(params[:page]).per(500).total_pages
    respond_to do |format|
      format.html
      format.xlsx do
        response.headers['Content-Disposition'] = "attachment; filename='#{@timestamp}.xlsx'"
      end
    end
  end

  def admin_translations
    @translations = DefinitionTranslation.by_words.page(params[:page])
    @total_export_page = DefinitionTranslation.by_words.page(params[:page]).per(400).total_pages
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

  def export_definition
    @definitions = Definition.by_words.page(params[:page]).per(400)
    @timestamp = "d_p#{params[:page]}_#{Time.now.strftime('%d%m%Y%H%M')}"
    respond_to do |format|
      format.xlsx do
        response.headers['Content-Disposition'] = "attachment; filename=#{@timestamp}.xlsx"
      end
    end
  end

  def export_words
    @words = Word.all.order('name ASC').where.not(name: [nil, '']).page(params[:page]).per(500)
    @timestamp = "w_p#{params[:page]}_#{Time.now.strftime('%d%m%Y%H%M')}"
    respond_to do |format|
      format.xlsx do
        response.headers['Content-Disposition'] = "attachment; filename=#{@timestamp}.xlsx"
      end
    end
  end

  def export_translation
    @translations = DefinitionTranslation.by_words.page(params[:page]).per(400)
    @timestamp = "t_p#{params[:page]}_#{Time.now.strftime('%d%m%Y%H%M')}"
    respond_to do |format|
      format.xlsx do
        response.headers['Content-Disposition'] = "attachment; filename=#{@timestamp}.xlsx"
      end
    end
  end

end