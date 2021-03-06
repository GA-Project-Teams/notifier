require 'spec_helper'

describe "UserAddPages" do
  
  describe "can visit user add page" do
    # include Devise::TestHelpers
    
    before do
      admin = Factory.create(:role)
      user = Factory.create(:user, :role_ids => admin.id) 
      visit root_path
      
      fill_in 'user_email', :with => user.email
      fill_in 'user_password', :with => user.password
      click_button "Sign in"
      
      page.should have_content(user.first_name)
      click_link "ADD CONTACT"
    end
    
    it "and add new user" do
      ActionMailer::Base.deliveries = []
            
      fill_in 'user_first_name', :with => Faker::Name.first_name
      fill_in 'user_last_name', :with => Faker::Name.last_name
      fill_in 'user_email', :with => Faker::Internet.email
      fill_in 'user_company_name', :with => Faker::Company.name
      fill_in 'user_phone_number', :with => Faker::PhoneNumber.phone_number
      # select 'users_preference', :with => @user.preference
     
      expect { 
          click_button "ADD CONTACT" 
        }.to change { User.count }.by(1)
      
      ActionMailer::Base.deliveries.should_not be_empty
       
    end

    it "and cannot add user with existing email address" do
      user = Factory.create(:user)
            
      fill_in 'user_first_name', :with => Faker::Name.first_name
      fill_in 'user_last_name', :with => Faker::Name.last_name
      fill_in 'user_email', :with => user.email
      fill_in 'user_company_name', :with => Faker::Company.name
      fill_in 'user_phone_number', :with => Faker::PhoneNumber.phone_number
      # select 'users_preference', :with => @user.preference
     
      click_button "ADD CONTACT" 

      page.should have_content("has already been taken")
      
    end
    
    it "and cancel adding users" do
      click_link "OR CANCEL"
      page.current_path.should == new_message_path
    end
  end
end
