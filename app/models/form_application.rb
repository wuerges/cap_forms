class FormApplication < ApplicationRecord
  belongs_to :semester
  belongs_to :form_template

end
