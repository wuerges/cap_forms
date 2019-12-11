class Major < ApplicationRecord
    has_and_belongs_to_many :users
    has_and_belongs_to_many :professors
    has_and_belongs_to_many :ccrs

    def to_s
        name
    end
end
