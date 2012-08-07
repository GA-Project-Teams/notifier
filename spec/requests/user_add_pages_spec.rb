require 'spec_helper'

describe "UserAddPages" do
  
  describe "can visit user add page", :js => true do
    # include Devise::TestHelpers
    # let(:user) { FactoryGirl.create(:user) }
    
    before do
      @user = Factory.create(:user)
      visit users_path
      
      fill_in 'user_email', :with => @user.email
      fill_in 'user_password', :with => @user.password
      click_button "Sign in"
      
      page.should have_content(@user.email)
      
    end
    
    it "and add new user" do
      visit '/users/add'
      # click_button 'ADD CONTACT'
      
      fill_in '_users_first_name', :with => @user.first_name
      fill_in '_users_last_name', :with => @user.last_name
      fill_in '_users_email', :with => @user.email
      fill_in '_users_company_name', :with => @user.company_name
      # fill_in '_users_phone_name', :with => @user.phone_number
      # select 'users_preference', :with => @user.preference
      
      expect { click_button "ADD CONTACT" }.to raise_error(
        ActiveRecord::RecordInvalid
      )
      
      # page.current_path.should == edit_users_path
      
      # page.should have_content(user.first_name)
      #       page.should have_content(user.last_name)
      #       page.should have_content(user.company_name)
      #       page.should have_content(user.email)
      #       page.should have_content(user.phone_number)
      # page.should have_content(user.preference)
      
      page.should have_content(@user.email)
      

      
    end
    
    xit "and cancel adding users" do
      click_link "CANCEL"
      page.current_path.should == root_path
    end
  end
end
