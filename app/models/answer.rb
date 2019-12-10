class Answer < ApplicationRecord
    enum answer_type: [:checkbox, :radio, :textarea]
end
