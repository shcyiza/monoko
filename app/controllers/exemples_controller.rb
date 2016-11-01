class ExemplesController < ApplicationController
  before_action :set_exemple, only: [:show, :edit, :update, :destroy]

  # GET /exemples
  # GET /exemples.json
  def index
    @exemples = Exemple.all
  end

  # GET /exemples/1
  # GET /exemples/1.json
  def show
  end

  # GET /exemples/new
  def new
    @exemple = Exemple.new
  end

  # GET /exemples/1/edit
  def edit
  end

  # POST /exemples
  # POST /exemples.json
  def create
    @exemple = Exemple.new(exemple_params)

    respond_to do |format|
      if @exemple.save
        format.html { redirect_to :back, notice: 'Exemple was successfully created.' }
        format.json { render :show, status: :created, location: @exemple }
      else
        format.html { render :new }
        format.json { render json: @exemple.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exemples/1
  # PATCH/PUT /exemples/1.json
  def update
    respond_to do |format|
      if @exemple.update(exemple_params)
        format.html { redirect_to @exemple, notice: 'Exemple was successfully updated.' }
        format.json { render :show, status: :ok, location: @exemple }
      else
        format.html { render :edit }
        format.json { render json: @exemple.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exemples/1
  # DELETE /exemples/1.json
  def destroy
    @exemple.destroy
    respond_to do |format|
      format.html { redirect_to exemples_url, notice: 'Exemple was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exemple
      @exemple = Exemple.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exemple_params
      params.require(:exemple).permit(:content, :is_fr, :is_li, :definition_id, :contributor_id, :source, :is_validated)
    end
end
