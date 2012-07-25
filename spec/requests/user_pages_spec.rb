require 'spec_helper'

describe "UserPages" do
  describe "should visit login page" do
    it "and login successfully" do
      @user = FactoryGirl.user
      visit root_path
      fill_in 'user_email', :with => @user.email
      fill_in 'user_first_name', :with => @user.first_name
      fill_in 'user_last_name', :with => @user.last_name
      fill_in 'user_password', :with => @user.password
      click_button "Sign in"
      
      page.should have_content("Logged in successfully")
    end
  end
end
