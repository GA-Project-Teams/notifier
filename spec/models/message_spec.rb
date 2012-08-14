require 'spec_helper'

describe Message do
  
  context "should not be valid" do
    it "without content" do
      message = Message.new(to_user_id: "1", from_user_id: "1", message_type_id: "1")
      message.should_not be_valid
    end
    
    it "without to_user_id" do
      message = Message.new(content: "Hi", from_user_id: "1", message_type_id: "1")
      message.should_not be_valid
    end
    
    it "without from_user_id" do
      message = Message.new(content: "Hi", to_user_id: "1", message_type_id: "1")
      message.should_not be_valid
    end
    
    it "without message_type_id" do
      message = Message.new(content: "Hi", to_user_id: "1", from_user_id: "1")
      message.should_not be_valid
    end
    
  end
  
  it { should respond_to(:content) }
  it { should respond_to(:to_user_id) }
  it { should respond_to(:from_user_id) }
  it { should respond_to(:message_type_id) }
  
end
