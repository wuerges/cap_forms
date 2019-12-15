class User < ApplicationRecord
  has_secure_password
  has_and_belongs_to_many :majors
  enum role_type: [:admin, :manager, :professor]
    
end
