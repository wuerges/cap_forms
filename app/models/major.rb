class Major < ApplicationRecord
    has_and_belongs_to_many :users
    has_and_belongs_to_many :professors

    def to_s
        name
    end
end
