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
    
  end
  
  context "can send notification to a user" do

    it "when email is selected" do
      # selector = '#message_to_user_name'
      to_user = Factory.create(:user, :preference => '2')

      fill_in 'message_user_id', :with => to_user.full_name
      fill_in 'message_to_user_name', :with => "#{to_user.first_name} #{to_user.last_name}"
      # sleep(3)
      # page.execute_script " $('#{selector}').trigger(\"mouseenter\").click();"

      fill_in 'message_content', :with => Faker::Lorem.paragraph[0..160]
 

      # page.current_path.should == new_message_path
      ActionMailer::Base.deliveries = []
      
      choose 'message_message_type_id_2'
      click_button 'SEND NOTIFICATION'
    
      ActionMailer::Base.deliveries.should_not be_empty
    end
    
    it "when sms is selected" do
      VCR.use_cassette "messages/phone_number" do
        to_user = Factory.create(:user, :preference => '1')

        select 'message_user_id', :with => to_user.full_name
        # fill_in 'message_to_user_name', :with => "#{to_user.first_name} #{to_user.last_name}"
        fill_in 'message_content', :with => Faker::Lorem.paragraph[0..100]
 
        # page.current_path.should == new_message_path

        choose 'message_message_type_id_1'
        click_button 'SEND NOTIFICATION'
      end
    end
    
    it "when both are selected" do
      VCR.use_cassette "messages/phone_number" do
        # selector = '#message_to_user_id'
        # to_user = Factory.create(:user, :preference => '3')
        to_user = Factory.create(:user, :preference => '3')

        fill_in 'message_user_id', :with => to_user.full_name
        fill_in 'message_to_user_name', :with => "#{to_user.first_name} #{to_user.last_name}"
        # sleep(3)
        # page.execute_script " $('#{selector}').
        #   trigger(\"mouseenter\").click();"
        fill_in 'message_content', :with => Faker::Lorem.paragraph[0..100]
 
        ActionMailer::Base.deliveries = []

        choose 'message_message_type_id_3'
        click_button 'SEND NOTIFICATION'
        ActionMailer::Base.deliveries.should_not be_empty
      end
      
    end
  end    

end
