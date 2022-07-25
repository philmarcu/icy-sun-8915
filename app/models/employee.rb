class Employee < ApplicationRecord
  validates :name, presence: true
  validates :level, presence: true

  belongs_to :department
end