require 'rails_helper'

RSpec.describe Ticket, type: :model do
  describe 'relationships' do
    it { should have_many(:employee_tickets) }
    it { should have_many(:employees).through(:employee_tickets) }
  end

  describe 'validations' do
    it { should validate_presence_of(:subject) }
    it { should validate_presence_of(:age) }
  end

  describe 'class methods' do
    it 'orders by oldest to youngest' do
      hr = Department.create!(name: "Human Resources", floor: "Third")
      it = Department.create!(name: "Info Technology", floor: "First")
      ad = Department.create!(name: "Marketing", floor: "Second")

      mark = ad.employees.create!(name: "Marky Mark", level: 2)
      jeff = it.employees.create!(name: "Jeff C", level: 1)
      dana = hr.employees.create!(name: "Dana W", level: 3)

      toast = mark.tickets.create!(subject: "Toasters dead", age: 2)
      fridge = jeff.tickets.create!(subject: "Someone ate my Doritos", age: 7)
      paper = dana.tickets.create!(subject: "We`re out of  printer paper", age: 80)

      expect(Ticket.order_by_age).to eq([paper, fridge, toast])
    end
  end
end