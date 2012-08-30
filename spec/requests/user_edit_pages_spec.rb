require 'spec_helper'

describe "UserEditPages" do
  describe "can visit user edit page" do
    
    before do
      admin = Factory.create(:role)
      @user = Factory.create(:user, :role_ids => admin.id) 

      visit root_path
      
      fill_in 'user_email', :with => @user.email
      fill_in 'user_password', :with => @user.password
      click_button "Sign in"
      visit edit_user_path(@user)
      page.current_path.should == edit_user_path(@user)
      
    end
    
    it "and edit a user" do
      
      # ActionMailer::Base.deliveries = []
      fill_in 'user_first_name', :with => Faker::Name.first_name
      fill_in 'user_last_name', :with => Faker::Name.last_name
      fill_in 'user_email', :with => Faker::Internet.email
      fill_in 'user_company_name', :with => Faker::Company.name
      fill_in 'user_phone_number', :with => Faker::PhoneNumber.phone_number
      
      click_button "UPDATE"
      # ActionMailer::Base.deliveries.should_not be_empty

      page.current_path.should == user_path(@user)
      
      page.should have_link("VIEW CONTACTS")
      page.should have_link("SEND NOTIFICATION")
      
      
    end
    
    it "and cancel adding users" do
      click_link "OR CANCEL"
      page.current_path.should == new_message_path
    end
  end
end
