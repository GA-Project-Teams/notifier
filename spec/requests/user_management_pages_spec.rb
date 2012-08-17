require 'spec_helper'

describe "UserManagementPages" do
  context "can visit user management page" do
    before do
      @user = Factory.create(:user) 
      visit root_path
      
      fill_in 'user_email', :with => @user.email
      fill_in 'user_password', :with => @user.password
      click_button "Sign in"
      
      page.should have_content(@user.first_name)
      click_link "VIEW CONTACTS"
    end
    
    describe "and view users" do

      it "and be able to delete a user" do
        page.current_path.should == users_path
        users = User.all

        users.each do |u|
          page.should have_content(u.first_name)
          page.should have_content(u.last_name)
          page.should have_content(u.email)
          page.should have_content(u.company_name)
          page.should have_link("NOTIFY")
          page.should have_link("EDIT")
          page.should have_link("DELETE")
        end
        
        expect { click_link "DELETE" }.to change{ User.count }.by(-1)
        
      end
      
      it "and notify user" do
        click_link "NOTIFY"
        page.current_path.should == notify_message_path(@user)
        page.current_path.should == "/messages/#{@user.id}/notify"
      end
      
      it "and edit user" do
        click_link "EDIT"
        page.current_path.should == edit_user_path(@user)
      end
      
    end
    
  end
end
