require 'spec_helper'

describe "UserManagementPages" do

  context "as a non admin user" do
    before do
      @regular_user = Factory.create(:user)

      visit root_path

      fill_in 'user_email', :with => @regular_user.email
      fill_in 'user_password', :with => @regular_user.password

      click_on "Sign in"

    end

    it "cannot view a list of users" do
      visit users_path
      page.current_path.should_not == users_path
      page.current_path.should == edit_user_path(@regular_user)
    end

    it "cannot view another user page" do
      user2 = Factory.create(:user)

      visit edit_user_path(user2)
      page.current_path.should_not == edit_user_path(user2)
      page.current_path.should == edit_user_path(@regular_user)
    end

    it "cannot create messages" do

      visit new_message_path
      page.current_path.should_not == new_message_path
      page.current_path.should == edit_user_path(@regular_user)
    end

    
  end
  
  context "as an admin user" do
    before do
      admin = Factory.create(:role)
      @user = Factory.create(:user, :role_ids => admin.id) 

      visit root_path
      
      fill_in 'user_email', :with => @user.email
      fill_in 'user_password', :with => @user.password
      click_button "Sign in"
      
      page.should have_content(@user.first_name)
      click_link "VIEW CONTACTS"
    end
    
    describe "can visit the user management page and view users" do

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

      it "and search by user first name" do
        fill_in 'q_first_name_or_last_name_or_company_name_cont', :with => @user.first_name
        page.should have_content(@user.full_name)
        page.should have_content(@user.company_name)
        page.should have_content(@user.phone_number)
        
      end

      it "and search by user last anem" do
        fill_in 'q_first_name_or_last_name_or_company_name_cont', :with => @user.last_name
        page.should have_content(@user.full_name)
        page.should have_content(@user.company_name)
        page.should have_content(@user.phone_number)
        
      end

      it "and search by user last anem" do
        fill_in 'q_first_name_or_last_name_or_company_name_cont', :with => @user.company_name
        page.should have_content(@user.full_name)
        page.should have_content(@user.company_name)
        page.should have_content(@user.phone_number)

        # keypress_script = "var e = $.Event('keydown', { keyCode: #{keycode} }); $('body').trigger(e);"
        # page.driver.browser.execute_script(keypress_script)
        
      end

      
    end
    
  end
end
