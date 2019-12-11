class Offer < ApplicationRecord
  belongs_to :ccr
  belongs_to :major
  has_and_belongs_to_many :professors

  def to_s
    "#{major} #{ccr} #{professors.map(&:name)}"
  end
end
