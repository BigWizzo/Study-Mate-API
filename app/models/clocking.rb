class Clocking < ApplicationRecord
  belongs_to :student
  belongs_to :subject

  validates :topic, presence: true
  validates :details, presence: true
  validates :duration, presence: true
end
