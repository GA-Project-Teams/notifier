# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :message do
    content { Faker::Lorem.paragraph[0..160] }
    to_user_id { rand(10) }
    from_user_id { rand(10) }
    message_type_id { rand(2) }
  end
  
  # factory :message_with_user, :parent => :message do 
  # end
    
  factory :user_with_message, :parent => :user do |user|
    user.after_create { |u| Factory(:message, :user => user) }
  end
  
end
