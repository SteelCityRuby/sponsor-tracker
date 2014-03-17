class PackageAddonTypesController < ApplicationController
  before_action :set_package_addon_type, only: [:show, :edit, :update, :destroy]

  # GET /package_addon_types
  # GET /package_addon_types.json
  def index
    @package_addon_types = PackageAddonType.all
  end

  # GET /package_addon_types/1
  # GET /package_addon_types/1.json
  def show
  end

  # GET /package_addon_types/new
  def new
    @package_addon_type = PackageAddonType.new
  end

  # GET /package_addon_types/1/edit
  def edit
  end

  # POST /package_addon_types
  # POST /package_addon_types.json
  def create
    @package_addon_type = PackageAddonType.new(package_addon_type_params)

    respond_to do |format|
      if @package_addon_type.save
        format.html { redirect_to @package_addon_type, notice: 'Package addon type was successfully created.' }
        format.json { render action: 'show', status: :created, location: @package_addon_type }
      else
        format.html { render action: 'new' }
        format.json { render json: @package_addon_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /package_addon_types/1
  # PATCH/PUT /package_addon_types/1.json
  def update
    respond_to do |format|
      if @package_addon_type.update(package_addon_type_params)
        format.html { redirect_to @package_addon_type, notice: 'Package addon type was successfully updated.' }
        format.json { render action: 'show', status: :ok, location: @package_addon_type }
      else
        format.html { render action: 'edit' }
        format.json { render json: @package_addon_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /package_addon_types/1
  # DELETE /package_addon_types/1.json
  def destroy
    @package_addon_type.destroy
    respond_to do |format|
      format.html { redirect_to package_addon_types_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_package_addon_type
      @package_addon_type = PackageAddonType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def package_addon_type_params
      params.require(:package_addon_type).permit(:name, :price, :total_spots)
    end
end
