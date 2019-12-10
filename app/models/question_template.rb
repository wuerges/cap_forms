class QuestionTemplate < ApplicationRecord
    has_and_belongs_to_many :answers
end
