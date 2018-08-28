class DefinitionTranslationsController < ApplicationController
  before_action :set_definition_translation, only: [:show, :edit, :update, :destroy]

  # GET /definition_translations
  # GET /definition_translations.json
  def index
    @definition_translations = DefinitionTranslation.all
  end

  # GET /definition_translations/1
  # GET /definition_translations/1.json
  def show
  end

  # GET /definition_translations/new
  def new
    @definition_translation = DefinitionTranslation.new
  end

  # GET /definition_translations/1/edit
  def edit
  end

  # POST /definition_translations
  # POST /definition_translations.json
  def create
    @definition_translation = DefinitionTranslation.new(definition_translation_params)

    respond_to do |format|
      if @definition_translation.save
        format.html { redirect_to :back, notice: 'Definition translation was successfully created.' }
        format.json { render :show, status: :created, location: @definition_translation }
      else
        format.html { render :new }
        format.json { render json: @definition_translation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /definition_translations/1
  # PATCH/PUT /definition_translations/1.json
  def update
    respond_to do |format|
      if @definition_translation.update(definition_translation_params)
        format.html { redirect_to @definition_translation, notice: 'Definition translation was successfully updated.' }
        format.json { render :show, status: :ok, location: @definition_translation }
      else
        format.html { render :edit }
        format.json { render json: @definition_translation.errors, status: :unprocessable_entity }
      end
    end
  end

  def import_updates
    if current_user.is_admin
      DefinitionTranslation.import_updates(params[:file], current_user)
      redirect_to '/definition_translations', notice: 'Les definiontion on bien été importé on bien ete modifié.'
    else
      redirect_back fallback_location: root_path, notice: "Vous n'etes pas autorisez a faire cette action"
    end
  end

  # DELETE /definition_translations/1
  # DELETE /definition_translations/1.json
  def destroy
    @definition_translation.destroy
    respond_to do |format|
      format.html { redirect_to definition_translations_url, notice: 'Definition translation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_definition_translation
      @definition_translation = DefinitionTranslation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def definition_translation_params
      params.require(:definition_translation).permit(:definition_id, :word_id,
                                                      :contributor_id)
    end
end
