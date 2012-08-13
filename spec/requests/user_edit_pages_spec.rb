require 'spec_helper'

describe "UserEditPages" do
  describe "can visit user edit page" do
    

    before(:each) do
      @user = Factory.create(:user) 
      visit root_path
      
      fill_in 'user_email', :with => @user.email
      fill_in 'user_password', :with => @user.password
      click_button "Sign in"
      visit edit_user_path(@user)
      page.current_path.should == edit_user_path(@user)
      
    end
    # sign_in :user
    
    it "and edit a user" do
      # visit root_path
      # click_button 'EDIT CONTACT'
    
      # page.should have_content(@user.first_name)
      #       page.should have_content(@user.last_name)
      #       page.should have_content(@user.company_name)
      #       page.should have_content(@user.email)
      #       page.should have_content(@user.phone_number)
      #       page.should have_content(@user.preference)
      #       
      fill_in 'user_first_name', :with => Faker::Name.first_name
      fill_in 'user_last_name', :with => Faker::Name.last_name
      fill_in 'user_email', :with => Faker::Internet.email
      fill_in 'user_company_name', :with => Faker::Company.name
      fill_in 'user_phone_number', :with => Faker::PhoneNumber.phone_number
      
      click_button "UPDATE"

      page.current_path.should == user_path(@user)
      
      page.should have_button("VIEW CONTACTS")
      page.should have_button("SEND NOTIFICATION")
      
      
    end
    
    it "and cancel adding users" do
      click_button "OR CANCEL"
      page.current_path.should == root_path
    end
  end
end
