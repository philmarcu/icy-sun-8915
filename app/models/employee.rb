class Employee < ApplicationRecord
  validates :name, presence: true
  validates :level, presence: true

  belongs_to :department
  has_many :employee_tickets
  has_many :tickets, through: :employee_tickets

  def dept_name
    department.name
  end
end