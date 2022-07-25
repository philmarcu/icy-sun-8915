# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

hr = Department.create!(name: "Human Resources", floor: "Third")
it = Department.create!(name: "Info Technology", floor: "First")
ad = Department.create!(name: "Marketing", floor: "Second")

mark = ad.employees.create!(name: "Marky Mark", level: 2)
jeff = it.employees.create!(name: "Jeff C", level: 1)
dana = hr.employees.create!(name: "Dana W", level: 3)
greg = it.employees.create!(name: "Old Greg", level: 1)
joe = ad.employees.create!(name: "Marky Mark", level: 2)
dale = ad.employees.create!(name: "Dale Dimmadome", level: 2)
laney = hr.employees.create!(name: "Laney L.", level: 3)