require 'spec_helper'

describe "UserPages" do
  describe "should visit login page" do
    before do
      visit users_path
    end
    let(:user) { FactoryGirl.create(:user) }
    
    it "and login successfully" do
      
      # expect { user2.save }.to change { User.count }.by(1)
      
      fill_in 'user_email', :with => user.email
      fill_in 'user_password', :with => user.password
      click_button "Sign in"
      
      # page.should have_content("You have signed in successfully.")
      page.should have_content(user.email)
    end
  
    it "and login with a bad password and not login successfully" do
      fill_in 'user_email', :with => user.email
      fill_in 'user_password', :with => "badpassword"
      click_button "Sign in"
      # save_and_open_page
      
      # page.should have_content("FORGOT YOUR PASSWORD?")
    end
    
    it "and login and edit profile successfully" do
      
      fill_in 'user_email', :with => user.email
      fill_in 'user_password', :with => user.password
      click_button "Sign in"
      
      # page.should have_content("You have signed in successfully.")
      page.should have_content(user.email)
      
      click_link "Edit profile"
      
      fill_in 'user_email', :with => user.email
      fill_in 'user_company_name', :with => user.company_name
      # fill_in 'user_first_name', :with => user.first_name
      # fill_in 'user_last_name', :with => user.last_name
      fill_in 'user_password', :with => "new_password"
      fill_in 'user_password_confirmation', :with => "new_password"
      fill_in 'user_current_password', :with => user.password
      
      # expect { user.password }.to change 
      
      click_button "Update"
      
    end
    
    it "and login and logout successfully" do
      
      # expect { user2.save }.to change { User.count }.by(1)
      
      fill_in 'user_email', :with => user.email
      fill_in 'user_password', :with => user.password
      click_button "Sign in"
      
      # page.should have_content("You have signed in successfully.")
      page.should have_content(user.email)
      
      click_link "Logout"
      page.current_path.should == root_path
      page.should have_content("Greetings Stranger, I don't know you please try to Login")
      
    end
    
    it "and reset password" do
      ActionMailer::Base.deliveries = []
      
      click_link "Forgot your password?"
      fill_in 'user_email', :with => user.email      
      click_button "RESET PASSWORD"
      
      # page.should have_content("THANKS!")
      # save_and_open_page
      ActionMailer::Base.deliveries.should_not be_empty
    end
  end
  
end
