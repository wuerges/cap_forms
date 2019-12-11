class Semester < ApplicationRecord
  belongs_to :major
  has_and_belongs_to_many :offers


  def to_s
    "#{major} #{name}"
  end

end
