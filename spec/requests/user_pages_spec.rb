require 'spec_helper'

describe "UserPages" do
  describe "should visit login page", :js => true do
    before do
      visit users_path
    end
    let(:user) { FactoryGirl.create(:user) }
    xit "and sign up and login successfully" do
      click_link "Sign up"
      
      fill_in 'user_email', :with => @user.email
      fill_in 'user_first_name', :with => @user.first_name
      fill_in 'user_last_name', :with => @user.last_name
      fill_in 'user_password', :with => @user.password
      fill_in 'user_password_confirmation', :with => @user.password
      
      click_button "Sign up"
      
      page.should have_content(@user.email)
      # page.should have_content("Signed in successfully.")
      # page.current_path.should == users_path
      
    end
  
    it "and login successfully" do
      user.valid?.should be_true
      
      fill_in 'user_email', :with => user.email
      fill_in 'user_password', :with => user.password
      click_button "Sign in"
      
      p user.email
      p user.password
      
      
      page.should have_content("You have signed in successfully.")
      page.should have_content(user.email)
    end
  
  end
  
end
