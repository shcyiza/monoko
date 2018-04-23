class WordsController < ApplicationController
  before_action :set_word, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit]



  # GET /words
  # GET /words.json
  def index
    #@words, @alphaParams = Word.in_lingala.order('name ASC').alpha_paginate(params[:letter]){|word| word.name}
    @words = Word.in_lingala.order('name ASC').where.not(name: [nil, '']).page(params[:page])
  end

  def dico_fr
    @words = Word.in_french.order('name ASC').where.not(name: [nil, '']).page(params[:page])
  end

  def dico_li
    @words = Word.in_lingala.order('name ASC')
  end

  # GET /words/1
  # GET /words/1.json
  def show
    @definition = @word.definitions.new
    @definition_theme = DefinitionTheme.new
    @themes = Theme.all
    @exemple = Exemple.new
    @groups = Group.all
    @definition_group = DefinitionGroup.new
    @words = Word.all
    @definition_translation = DefinitionTranslation.new
    @group = Group.new
  end

  # GET /words/new
  def new
    @word = Word.new
  end

  # GET /words/1/edit
  def edit
  end

  # POST /words
  # POST /words.json
  def create
    @word = Word.new(word_params)

    respond_to do |format|
      if @word.save
        format.html { redirect_to @word, notice: 'Word was successfully created.' }
        format.json { render :show, status: :created, location: @word }
      else
        format.html { render :new }
        format.json { render json: @word.errors, status: :unprocessable_entity }
      end
    end
  end

  def import
    if current_user.is_admin
      Word.import_file(params[:file], current_user)
      redirect_to admin_words_path, notice: 'Les mots on bien ete importé.'
    else
      redirect_back fallback_location: root_path, notice: "Vous n'etes pas autorisez a faire cette action"
    end
  end

  def export

  end

  # PATCH/PUT /words/1
  # PATCH/PUT /words/1.json
  def update
    respond_to do |format|
      if @word.update(word_params)
        format.html { redirect_to @word, notice: 'Word was successfully updated.' }
        format.json { render :show, status: :ok, location: @word }
      else
        format.html { render :edit }
        format.json { render json: @word.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /words/1
  # DELETE /words/1.json
  def destroy
    @word.destroy
    respond_to do |format|
      format.html { redirect_to words_url, notice: 'Word was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_word
      @word = Word.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def word_params
      params.require(:word).permit(:name, :is_fr, :is_li,
                                  :prononciation, :root, :structure, :role,
                                  :contributor_id, :source, :is_validated,
                                  :image, :image_title, :image_description, :image_url)
    end
end
