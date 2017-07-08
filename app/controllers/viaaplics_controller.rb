class ViaaplicsController < ApplicationController
  before_action :set_viaaplic, only: [:show, :edit, :update, :destroy]

  # GET /viaaplics
  # GET /viaaplics.json
  def index
    @viaaplics = Viaaplic.all
  end

  # GET /viaaplics/1
  # GET /viaaplics/1.json
  def show
  end

  # GET /viaaplics/new
  def new
    @viaaplic = Viaaplic.new
  end

  # GET /viaaplics/1/edit
  def edit
  end

  # POST /viaaplics
  # POST /viaaplics.json
  def create
    @viaaplic = Viaaplic.new(viaaplic_params)

    respond_to do |format|
      if @viaaplic.save
        format.html { redirect_to @viaaplic, notice: 'Viaaplic was successfully created.' }
        format.json { render :show, status: :created, location: @viaaplic }
      else
        format.html { render :new }
        format.json { render json: @viaaplic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /viaaplics/1
  # PATCH/PUT /viaaplics/1.json
  def update
    respond_to do |format|
      if @viaaplic.update(viaaplic_params)
        format.html { redirect_to @viaaplic, notice: 'Viaaplic was successfully updated.' }
        format.json { render :show, status: :ok, location: @viaaplic }
      else
        format.html { render :edit }
        format.json { render json: @viaaplic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /viaaplics/1
  # DELETE /viaaplics/1.json
  def destroy
    @viaaplic.destroy
    respond_to do |format|
      format.html { redirect_to viaaplics_url, notice: 'Viaaplic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_viaaplic
      @viaaplic = Viaaplic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def viaaplic_params
      params.fetch(:viaaplic, {})
    end
end
