require "spec_helper"

describe UserMailer do
  describe "signup_confirmation" do
    
    let(:user) { Factory.create(:user) }
    let(:to_user) { Factory.create(:user) }
    let(:from_user) { Factory.create(:user) }
    let(:mail) { UserMailer.signup_confirmation(user) }
    let(:message) { Message.create!(content: Faker::Lorem.paragraph, user_id: to_user.id, from_user_id: from_user.id, message_type_id: 2) }
    
    it "renders the headers" do
      mail.subject.should eq("Welcome!")
      mail.to.should eq([user.email])
      mail.from.should eq(["notifier@ga-notifier.herokuapp.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match(user.first_name)
    end
    
    it "should deliver a signup email" do
      ActionMailer::Base.deliveries = []
      UserMailer.signup_confirmation(user).deliver
      ActionMailer::Base.deliveries.should_not be_empty
      # post :signup_confirmation, "Email" => "to@example.com", "Name" => "Peter To"
    end
    
    it "should deliver a contact update email" do
      ActionMailer::Base.deliveries = []
      UserMailer.edit_contact_info(user).deliver
      ActionMailer::Base.deliveries.should_not be_empty
    end
    
    it "should deliver a notification email" do
      ActionMailer::Base.deliveries = []
      UserMailer.notify_user(to_user, message).deliver
      ActionMailer::Base.deliveries.should_not be_empty
    end
  end

end
