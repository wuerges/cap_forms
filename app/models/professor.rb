class Professor < ApplicationRecord
    has_and_belongs_to_many :majors
    validate do |prof|
        if prof.majors.size == 0
            self.errors[:base] << "Professor has no majors"
        end
    end

    def major_ids
        if majors
            majors.collect { |m| m.id }
        end
    end

end
