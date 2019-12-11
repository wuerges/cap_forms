class FormTemplate < ApplicationRecord
    has_and_belongs_to_many :questions
    accepts_nested_attributes_for :questions

    def question_ids 
        if questions
            questions.collect { |q| q.id }
        end
    end

    def sorted_questions
        questions.order(:priority)
    end
end
