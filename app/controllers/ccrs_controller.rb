class CcrsController < ApplicationController
  before_action :set_ccr, only: [:show, :edit, :update, :destroy]

  # GET /ccrs
  # GET /ccrs.json
  def index
    @ccrs = Ccr.all
  end

  # GET /ccrs/1
  # GET /ccrs/1.json
  def show
  end

  # GET /ccrs/new
  def new
    @ccr = Ccr.new
  end

  # GET /ccrs/1/edit
  def edit
  end

  # POST /ccrs
  # POST /ccrs.json
  def create
    @ccr = Ccr.new(ccr_params)

    respond_to do |format|
      if @ccr.save
        format.html { redirect_to @ccr, notice: 'Ccr was successfully created.' }
        format.json { render :show, status: :created, location: @ccr }
      else
        format.html { render :new }
        format.json { render json: @ccr.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ccrs/1
  # PATCH/PUT /ccrs/1.json
  def update
    respond_to do |format|
      if @ccr.update(ccr_params)
        format.html { redirect_to @ccr, notice: 'Ccr was successfully updated.' }
        format.json { render :show, status: :ok, location: @ccr }
      else
        format.html { render :edit }
        format.json { render json: @ccr.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ccrs/1
  # DELETE /ccrs/1.json
  def destroy
    @ccr.destroy
    respond_to do |format|
      format.html { redirect_to ccrs_url, notice: 'Ccr was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ccr
      @ccr = Ccr.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ccr_params
      params.require(:ccr).permit(:name)
    end
end
