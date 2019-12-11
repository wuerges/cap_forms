class Report < ApplicationRecord
    has_and_belongs_to_many :form_applications
end
