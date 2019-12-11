class FormApplication < ApplicationRecord
  belongs_to :semester
  belongs_to :form_template

  def to_s
    "#{semester.to_s} #{form_template.name}"
  end
end
