class Student < ApplicationRecord
  has_secure_password
  # has_many :subjects, :dependent => :delete_all
  # has_many :clockings, :dependent => :delete_all
  # validates :username, uniqueness: true

  validates :password_digest, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true, length: { minimum: 1, maximum: 30 }

  has_many :subjects, dependent: :destroy
  has_many :clockings, dependent: :destroy
end
