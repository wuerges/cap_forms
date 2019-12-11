class FormSubmissionsController < ApplicationController
  before_action :set_form_submission, only: [:show, :edit, :update, :destroy]

  # GET /form_submissions
  # GET /form_submissions.json
  def index
    @form_submissions = FormSubmission.all
  end

  # GET /form_submissions/1
  # GET /form_submissions/1.json
  def show
  end

  # GET /form_submissions/new
  def new
    @form_submission = FormSubmission.new
  end

  def submit_form
    @form_application = FormApplication.find(params[:id])
    @professor = Professor.find(params[:professor_id])
    @offer = Offer.find(params[:offer_id])
  end

  def submit_form_post

    @form_application = FormApplication.find(params.require(:id))
    @professor = Professor.find(params.require(:professor_id))
    @offer = Offer.find(params.require(:offer_id))

    for question_id, ans in params.permit(answers: {})[:answers]
      for answer_id, txt in ans
        @fs = FormSubmission.new
        @fs.form_application = @form_application
        @fs.professor = @professor
        @fs.offer = @offer
        @fs.answer = Answer.find(answer_id)
        @fs.question = Question.find(question_id)
        @fs.text = txt
        @fs.save!
      end
    end

  end

  # GET /form_submissions/1/edit
  def edit
  end

  # POST /form_submissions
  # POST /form_submissions.json
  def create
    @form_submission = FormSubmission.new(form_submission_params)

    respond_to do |format|
      if @form_submission.save
        format.html { redirect_to @form_submission, notice: 'Form submission was successfully created.' }
        format.json { render :show, status: :created, location: @form_submission }
      else
        format.html { render :new }
        format.json { render json: @form_submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /form_submissions/1
  # PATCH/PUT /form_submissions/1.json
  def update
    respond_to do |format|
      if @form_submission.update(form_submission_params)
        format.html { redirect_to @form_submission, notice: 'Form submission was successfully updated.' }
        format.json { render :show, status: :ok, location: @form_submission }
      else
        format.html { render :edit }
        format.json { render json: @form_submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /form_submissions/1
  # DELETE /form_submissions/1.json
  def destroy
    @form_submission.destroy
    respond_to do |format|
      format.html { redirect_to form_submissions_url, notice: 'Form submission was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_form_submission
      @form_submission = FormSubmission.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def form_submission_params
      params.require(:form_submission).permit(:question_id, :form_application_id, :professor_id, :offer_id, :question_id, :answer_id)
    end
end
