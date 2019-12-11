class Question < ApplicationRecord
  belongs_to :question_template
  enum question_type: [:ccr, :major, :professor]

  def template_id
    if self.question_template
      self.question_template.id
    end
  end
end
