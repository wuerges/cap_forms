class QuestionTemplate < ApplicationRecord
    has_and_belongs_to_many :answers
    accepts_nested_attributes_for :answers

    def anwer_ids 
      answers.collect { |a| a.id }
    end

end
