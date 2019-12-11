class FormSubmission < ApplicationRecord
  belongs_to :question
  belongs_to :form_application
  belongs_to :professor
  belongs_to :offer
  belongs_to :question
  belongs_to :answer
end
