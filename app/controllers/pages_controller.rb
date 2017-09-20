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
    @users = User.all
  end

  def admin_words
    @users = User.all
  end

  def admin_translations
    @users = User.all
  end

  def admin_definitions
    @users = User.all
  end

  def admin_definition_themes
    @users = User.all
  end

  def admin_themes
    @users = User.all
  end

  def admin_definition_groups
    @users = User.all
  end

  def admin_groups
    @users = User.all
  end

  def admin_searches
    @users = User.all
  end

end
