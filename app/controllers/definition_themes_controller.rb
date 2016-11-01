class DefinitionThemesController < ApplicationController
  before_action :set_definition_theme, only: [:show, :edit, :update, :destroy]

  # GET /definition_themes
  # GET /definition_themes.json
  def index
    @definition_themes = DefinitionTheme.all
  end

  # GET /definition_themes/1
  # GET /definition_themes/1.json
  def show
  end

  # GET /definition_themes/new
  def new
    @definition_theme = DefinitionTheme.new
  end

  # GET /definition_themes/1/edit
  def edit
  end

  # POST /definition_themes
  # POST /definition_themes.json
  def create
    @definition_theme = DefinitionTheme.new(definition_theme_params)

    respond_to do |format|
      if @definition_theme.save
        format.html { redirect_to :back, notice: 'Definition theme was successfully created.' }
        format.json { render :show, status: :created, location: @definition_theme }
      else
        format.html { render :new }
        format.json { render json: @definition_theme.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /definition_themes/1
  # PATCH/PUT /definition_themes/1.json
  def update
    respond_to do |format|
      if @definition_theme.update(definition_theme_params)
        format.html { redirect_to @definition_theme, notice: 'Definition theme was successfully updated.' }
        format.json { render :show, status: :ok, location: @definition_theme }
      else
        format.html { render :edit }
        format.json { render json: @definition_theme.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /definition_themes/1
  # DELETE /definition_themes/1.json
  def destroy
    @definition_theme.destroy
    respond_to do |format|
      format.html { redirect_to definition_themes_url, notice: 'Definition theme was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_definition_theme
      @definition_theme = DefinitionTheme.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def definition_theme_params
      params.require(:definition_theme).permit(:definition_id, :theme_id)
    end
end
