class Subject < ApplicationRecord
  belongs_to :student
  has_many :clockings, dependent: :delete_all
end
