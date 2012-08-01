require "spec_helper"

describe UserMailer do
  describe "signup_confirmation" do
    
    let(:mail) { UserMailer.signup_confirmation }

    it "renders the headers" do
      mail.subject.should eq("Signup confirmation")
      mail.to.should eq(["pt9386@gmail.com"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
    
    it "should deliver a signup email" do
      ActionMailer::Base.deliveries = []
      UserMailer.signup_confirmation.deliver
      
      ActionMailer::Base.deliveries.should_not be_empty
      # post :signup_confirmation, "Email" => "to@example.com", "Name" => "Peter To"
    end
  end

end
