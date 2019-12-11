class Question < ApplicationRecord
  belongs_to :question_template
  has_and_belongs_to_many :form_templates

  enum question_type: [:ccr, :major, :professor]

  def template_id
    if question_template
      question_template.id
    end
  end

  def to_s
    "#{priority}: #{text}"
  end
end
