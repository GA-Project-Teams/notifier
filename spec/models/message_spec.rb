require 'spec_helper'

describe Message do
  
  context "should not be valid" do
    it "without content" do
      user = FactoryGirl.create(:user)
      from_user = FactoryGirl.create(:user)
      message = Message.new(user_id: user.id, from_user_id: from_user.id, message_type_id: "1")
      message.should_not be_valid
    end
    
    it "without user_full_name" do
      user = FactoryGirl.create(:user)
      from_user = FactoryGirl.create(:user)
      message = Message.new(content: "Hi", from_user_id: from_user.id, message_type_id: "1")
      message.should_not be_valid
    end
    
    it "without from_user_id" do
      user = FactoryGirl.create(:user)
      from_user = FactoryGirl.create(:user)
      message = Message.new(content: "Hi", user_id: user.id, message_type_id: "1")
      message.should_not be_valid
    end
    
    it "without message_type_id" do
      user = FactoryGirl.create(:user)
      from_user = FactoryGirl.create(:user)
      message = Message.new(content: "Hi", user_id: user.id, from_user_id: from_user.id)
      message.should_not be_valid
    end
  end
  
  context "raises an error without" do
    let(:message) { Message.new }
    it "content" do
      expect { message.save! }.to raise_error(
        ActiveRecord::RecordInvalid
      )
    end
    it "user_full_name" do
      expect { message.save! }.to raise_error(
        ActiveRecord::RecordInvalid
      )
    end
    it "from_user_id" do
      expect { message.save! }.to raise_error(
        ActiveRecord::RecordInvalid
      )
    end
    it "message_type_id" do
      expect { message.save! }.to raise_error(
        ActiveRecord::RecordInvalid
      )
    end
  end
  
  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should respond_to(:from_user_id) }
  it { should respond_to(:message_type_id) }
  
  it { should validate_presence_of(:content) }
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:from_user_id) }
  it { should validate_presence_of(:message_type_id) }
  
  # it "should change the number of messages by 1" do
  #   expect { message = Factory(:message) }.to change { Message.count }.by(1)
  # end
  
end
