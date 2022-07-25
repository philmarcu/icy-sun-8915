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

  context 'user story 3' do
    it 'can add tickets to the employee show page' do
      it = Department.create!(name: "Info Technology", floor: "First")
      ad = Department.create!(name: "Marketing", floor: "Second")


      jeff = it.employees.create!(name: "Jeff C", level: 1)
      greg = it.employees.create!(name: "Old Greg", level: 1)
      mark = ad.employees.create!(name: "Marky Mark", level: 2)

      old = greg.tickets.create!(subject: "I'm old greg", age: 9000)
      paper = greg.tickets.create!(subject: "We`re out of printer paper", age: 80)
      parking = jeff.tickets.create!(subject:"We ran out of parking", age: 4)

      visit "employees/#{greg.id}"

      expect(page).to have_content("I'm old greg")
      expect(page).to have_content("We`re out of printer paper")
      expect(page).to_not have_content("Ticket Issue: We ran out of parking")

      fill_in 'ticket_number', with: "#{parking.id}"
      click_on 'Submit'

      save_and_open_page

      expect(page).to have_content("Ticket Issue: We ran out of parking")
    end
  end
end