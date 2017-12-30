class PagesController < ApplicationController
  before_action :set_word, only: [:show, :edit, :update, :destroy]


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
   
    @words = Word.all
  end

  def admin_translations
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


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_word
      @word = Word.find(params[:id])
    end

end
