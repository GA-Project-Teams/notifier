require 'spec_helper'

describe "UserAddPages" do
  
  describe "can visit user add page" do
    # include Devise::TestHelpers
    # let(:user) { FactoryGirl.create(:user) }
    
    before do
      user = Factory.create(:user) 
      visit users_path
      
      fill_in 'user_email', :with => user.email
      fill_in 'user_password', :with => user.password
      click_button "Sign in"
      
      page.should have_content(user.email)
      
    end
    
    it "and add new user" do
      visit new_user_path
      # click_button 'ADD CONTACT'
      # test_user = Factory.create(:user)
      
      fill_in 'user_first_name', :with => Faker::Name.first_name
      fill_in 'user_last_name', :with => Faker::Name.last_name
      fill_in 'user_email', :with => Faker::Internet.email
      fill_in 'user_company_name', :with => Faker::Company.name
      # fill_in '_users_phone_name', :with => @user.phone_number
      # select 'users_preference', :with => @user.preference
      
      expect { 
        click_button "ADD CONTACT" 
        }.to change { User.count }.by(1)
      # save_and_open_page
      # page.current_path.should == edit_users_path
      
      # page.should have_content(user.first_name)
      #       page.should have_content(user.last_name)
      #       page.should have_content(user.company_name)
      #       page.should have_content(user.email)
      #       page.should have_content(user.phone_number)
      # page.should have_content(user.preference)
       
    end
    
    xit "and cancel adding users" do
      click_link "CANCEL"
      page.current_path.should == root_path
    end
  end
end
