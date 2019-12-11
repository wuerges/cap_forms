class MajorsController < ApplicationController
  before_action :set_major, only: [:show, :edit, :update, :destroy]

  # GET /majors
  # GET /majors.json
  def index
    @majors = Major.all
  end

  # GET /majors/1
  # GET /majors/1.json
  def show
  end

  # GET /majors/new
  def new
    @major = Major.new
  end

  # GET /majors/1/edit
  def edit
  end

  # POST /majors
  # POST /majors.json
  def create
    @major = Major.new(major_params)

    respond_to do |format|
      if @major.save
        format.html { redirect_to @major, notice: 'Major was successfully created.' }
        format.json { render :show, status: :created, location: @major }
      else
        format.html { render :new }
        format.json { render json: @major.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /majors/1
  # PATCH/PUT /majors/1.json
  def update
    respond_to do |format|
      if @major.update(major_params)
        format.html { redirect_to @major, notice: 'Major was successfully updated.' }
        format.json { render :show, status: :ok, location: @major }
      else
        format.html { render :edit }
        format.json { render json: @major.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /majors/1
  # DELETE /majors/1.json
  def destroy
    @major.destroy
    respond_to do |format|
      format.html { redirect_to majors_url, notice: 'Major was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_major
      @major = Major.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def major_params
      params.require(:major).permit(:name)
    end
end
