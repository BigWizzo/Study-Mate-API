class Subject < ApplicationRecord
  belongs_to :student
  has_many :clockings, dependent: :delete_all

  validates :student, presence: true
end
