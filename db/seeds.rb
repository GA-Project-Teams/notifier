# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(first_name: 'admin', last_name: 'user', email: 'test@test.com', company_name: 'GA', phone_number: '1234567890', password: 'test123', password_confirmation: 'test123')
User.create(first_name: 'admin', last_name: 'user', email: 'pt9386@gmail.com', company_name: 'GA', phone_number: '1234567890', password: 'test123', password_confirmation: 'test123')
# User.create(first_name: Faker::name.first_name, last_name: Faker::name.last_name)
# User.create(first_name: 'admin', last_name: 'user', email: 'test@test.com', company_name: 'GA', password: 'test123', password_confirmation: 'test123')
# User.create(first_name: 'admin', last_name: 'user', email: 'test@test.com', company_name: 'GA', password: 'test123', password_confirmation: 'test123')
# User.create(first_name: 'admin', last_name: 'user', email: 'test@test.com', company_name: 'GA', password: 'test123', password_confirmation: 'test123')
# User.create(first_name: 'admin', last_name: 'user', email: 'test@test.com', company_name: 'GA', password: 'test123', password_confirmation: 'test123')
