require "spec_helper"

describe UserMailer do
  describe "signup_confirmation" do
    
    let(:user) { Factory.create(:user) }
    let(:mail) { UserMailer.signup_confirmation(user) }
    

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
  end

end
