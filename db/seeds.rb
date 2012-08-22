# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
role = Role.create(name: 'admin')
User.create(email: 'test@test.com', first_name: 'test', last_name: 'admin', company_name: 'GA', password: 'test123', password_confirmation: 'test123', role_ids: role.id)
User.create(email: 't@test.com', first_name: 'test', last_name: 'admin', company_name: 'GA', password: 'asd', password_confirmation: 'asd')
User.create(email: 'a@test.com', first_name: 'Michael', last_name: 'admin', company_name: 'GA', password: 'asd', password_confirmation: 'asd')

(0..10).each do
  Factory.create(:user)
end

# Role.create(name: 'admin')
# first_name
