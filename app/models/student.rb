class Student < ApplicationRecord
  has_secure_password
  has_many :subjects
  has_many :clockings
  validates :username, uniqueness: true
end
