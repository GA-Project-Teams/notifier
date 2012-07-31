# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do

    email 'pt9386@gmail.com'
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    password "password12345"
    password_confirmation "password12345"
  end
end
