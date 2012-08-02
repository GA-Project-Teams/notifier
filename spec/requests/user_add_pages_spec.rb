require 'spec_helper'

describe "UserAddPages" do
  describe "can visit user add page" do
    
    visit root_path
    click_button 'ADD CONTACT'
    let(:user) { FactoryGirl.create(:user) }
    sign_in :user
    
    it "and add new user" do
      fill_in 'user_first_name', :with => user.first_name
      fill_in 'user_last_name', :with => user.last_name
      fill_in 'user_company_name', :with => user.company_name
      fill_in 'user_email', :with => user.email
      fill_in 'user_phone_name', :with => user.phone_number
      select 'user_preference', :with => user.preference
      
      click_button "ADD CONTACT"
      page.current_path.should == edit_users_path
      
      page.should have_content(user.first_name)
      page.should have_content(user.last_name)
      page.should have_content(user.company_name)
      page.should have_content(user.email)
      page.should have_content(user.phone_number)
      page.should have_content(user.preference)
      
    end
    
    it "and cancel adding users" do
      click_link "OR CANCEL"
      page.current_path.should == root_path
    end
  end
end
