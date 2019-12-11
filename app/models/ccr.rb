class Ccr < ApplicationRecord
    has_and_belongs_to_many :majors
    validate do |ccr|
        if ccr.majors.size == 0
            self.errors[:base] << "CCR has no majors"
        end
    end

    def professor_ids
        professors && professors.map(&:id)
    end

    def to_s
        name
    end
end
