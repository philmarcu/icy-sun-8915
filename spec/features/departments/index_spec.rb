require 'rails_helper'

RSpec.describe 'Dept index page' do
  context 'user story 1' do
    it 'lists all departments and employees' do
      hr = Department.create!(name: "Human Resources", floor: "Third")
      it = Department.create!(name: "Info Technology", floor: "First")
      ad = Department.create!(name: "Marketing", floor: "Second")

      mark = ad.employees.create!(name: "Marky Mark", level: 2)
      jeff = it.employees.create!(name: "Jeff C", level: 1)
      dana = hr.employees.create!(name: "Dana W", level: 3)
      greg = it.employees.create!(name: "Old Greg", level: 1)
      joe = ad.employees.create!(name: "Joe Schmoe", level: 2)

      visit "/departments"

      within "#dept-#{hr.id}" do
        expect(page).to have_content("Human Resources")
        expect(page).to have_content("Third Floor")
        expect(page).to_not have_content("Info Technology")
      end

      within "#dept-#{it.id}" do
        expect(page).to have_content("Info Technology")
        expect(page).to have_content("First Floor")
        expect(page).to_not have_content("Human Resources")
      end

      within "#dept-#{ad.id}" do
        expect(page).to have_content("Marketing")
        expect(page).to have_content("Second Floor")
        expect(page).to_not have_content("Human Resources")
      end
    end
  end
end