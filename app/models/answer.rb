class Answer < ApplicationRecord
    enum answer_type: [:checkbox, :radio, :textarea]
    has_and_belongs_to_many :question_templates
end
