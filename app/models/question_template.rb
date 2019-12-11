class QuestionTemplate < ApplicationRecord
    has_and_belongs_to_many :answers
    accepts_nested_attributes_for :answers

    def question_template_params
      logger.debug answers
    end

end
