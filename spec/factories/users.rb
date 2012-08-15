# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do

    email { Faker::Internet.email }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    company_name { Faker::Company.name }
    phone_number { Faker::PhoneNumber.phone_number }
    preference { 1 + rand(3) }
    password "test12345"
    password_confirmation "test12345"
  end
end
