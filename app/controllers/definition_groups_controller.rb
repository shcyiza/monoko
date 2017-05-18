class DefinitionGroupsController < ApplicationController
  before_action :set_definition_group, only: [:show, :edit, :update, :destroy]

  # GET /definition_groups
  # GET /definition_groups.json
  def index
    @definition_groups = DefinitionGroup.all
  end

  # GET /definition_groups/1
  # GET /definition_groups/1.json
  def show
  end

  # GET /definition_groups/new
  def new
    @definition_group = DefinitionGroup.new
  end

  # GET /definition_groups/1/edit
  def edit
  end

  # POST /definition_groups
  # POST /definition_groups.json
  def create
    @definition_group = DefinitionGroup.new(definition_group_params)

    respond_to do |format|
      if @definition_group.save
        format.html { redirect_to :back, notice: 'Definition group was successfully created.' }
        format.json { render :show, status: :created, location: @definition_group }
      else
        format.html { render :new }
        format.json { render json: @definition_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /definition_groups/1
  # PATCH/PUT /definition_groups/1.json
  def update
    respond_to do |format|
      if @definition_group.update(definition_group_params)
        format.html { redirect_to @definition_group, notice: 'Definition group was successfully updated.' }
        format.json { render :show, status: :ok, location: @definition_group }
      else
        format.html { render :edit }
        format.json { render json: @definition_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /definition_groups/1
  # DELETE /definition_groups/1.json
  def destroy
    @definition_group.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Definition group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_definition_group
      @definition_group = DefinitionGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def definition_group_params
      params.require(:definition_group).permit(:definition_id, :group_id, :contributor_id)
    end
end
