require 'spec_helper'

describe "MessageAddPages" do
  before do
    user = Factory.create(:user) 
    visit root_path
    
    page.current_path.should == new_user_session_path
    
    fill_in 'user_email', :with => user.email
    fill_in 'user_password', :with => user.password
    click_button "Sign in"
    
    page.should have_content(user.first_name)
    
    page.current_path.should == new_message_path
  end
  
  it "can send a message to a user" do
    to_user = Factory.create(:user)
    
    ActionMailer.deliveries = []

    fill_in 'message_to_user_id', :with => to_user.first_name 
    fill_in 'message_content', :with => Faker::Lorem.paragraph[0..160]
    
    click_button 'SEND NOTIFICATION'
    
    ActionMailer.deliveries.should_not be_empty
  end
    

end
