require 'rails_helper'

RSpec.describe 'employee show page' do
  context 'user story 2' do
    it 'lists the employees name, dept, and tickets' do
      it = Department.create!(name: "Info Technology", floor: "First")
      ad = Department.create!(name: "Marketing", floor: "Second")


      jeff = it.employees.create!(name: "Jeff C", level: 1)
      greg = it.employees.create!(name: "Old Greg", level: 1)
      mark = ad.employees.create!(name: "Marky Mark", level: 2)

      old = greg.tickets.create!(subject: "I'm old greg", age: 9000)
      paper = greg.tickets.create!(subject: "We`re out of printer paper", age: 80)

      visit "employees/#{greg.id}"

      expect(page).to have_content("Old Greg")
      expect(page).to have_content("Info Technology")
      expect(page).to have_content("Ticket Issue: I'm old greg")
      expect(page).to have_content("Ticket Issue: We`re out of printer paper")
      expect(page).to have_content("#{old.age} months since first issued")
      expect(page).to_not have_content("Jeff C")
      expect(page).to_not have_content("Marketing")
      expect(page).to_not have_content("Marky Mark")
    end
  end
end