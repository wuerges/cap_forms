class Professor < ApplicationRecord
    has_and_belongs_to_many :majors

    def major_ids
        if majors
            majors.collect { |m| m.id }
        end
    end

end
