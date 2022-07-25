require 'rails_helper'

RSpec.describe Employee, type: :model do
  describe 'relationships' do
    it { should belong_to :department }
    it {should have_many :employee_tickets}
    it {should have_many(:tickets).through(:employee_tickets)}
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:level) }
  end

  describe 'instance methods' do
    it 'returns dept name' do
      hr = Department.create!(name: "Human Resources", floor: "Third")
      it = Department.create!(name: "Info Technology", floor: "First")

      dana = hr.employees.create!(name: "Dana W", level: 3)
      jeff = it.employees.create!(name: "Jeff C", level: 1)
      
      expect(dana.dept_name).to eq("Human Resources")
      expect(jeff.dept_name).to eq("Info Technology")
    end
  end
end