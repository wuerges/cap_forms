class FormApplicationsController < ApplicationController
  before_action :set_form_application, only: [:show, :edit, :update, :destroy]

  # GET /form_applications
  # GET /form_applications.json
  def index
    @form_applications = FormApplication.all
  end

  # GET /form_applications/1
  # GET /form_applications/1.json
  def show
  end

  # GET /form_applications/new
  def new
    @form_application = FormApplication.new
  end

  # GET /form_applications/1/edit
  def edit
  end

  # POST /form_applications
  # POST /form_applications.json
  def create
    @form_application = FormApplication.new(form_application_params)

    respond_to do |format|
      if @form_application.save
        format.html { redirect_to @form_application, notice: 'Form application was successfully created.' }
        format.json { render :show, status: :created, location: @form_application }
      else
        format.html { render :new }
        format.json { render json: @form_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /form_applications/1
  # PATCH/PUT /form_applications/1.json
  def update
    respond_to do |format|
      if @form_application.update(form_application_params)
        format.html { redirect_to @form_application, notice: 'Form application was successfully updated.' }
        format.json { render :show, status: :ok, location: @form_application }
      else
        format.html { render :edit }
        format.json { render json: @form_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /form_applications/1
  # DELETE /form_applications/1.json
  def destroy
    @form_application.destroy
    respond_to do |format|
      format.html { redirect_to form_applications_url, notice: 'Form application was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_form_application
      @form_application = FormApplication.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def form_application_params
      params.require(:form_application).permit(:semester_id, :form_template_id)
    end
end
