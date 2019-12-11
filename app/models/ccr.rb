class Ccr < ApplicationRecord
    has_and_belongs_to_many :majors

    def professor_ids
        professors && professors.map(&:id)
    end

    def to_s
        name
    end
end
