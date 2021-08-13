class Student < ApplicationRecord
  has_secure_password
  has_many :subjects, :dependent => :delete_all
  has_many :clockings, :dependent => :delete_all
  validates :username, uniqueness: true
end
