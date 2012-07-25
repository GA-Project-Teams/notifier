require 'spec_helper'

describe User do
  it "should create a new user" do
    user = User.new
    user.should_not be_valid
  end
  
  it "should not be valid without an email" do
    user = User.new(first_name: "peter", last_name: "to")
    user.should_not be_valid
  end
  
  it "should change the number of Users" do
    user = User.new(first_name: "peter", last_name: "to", email: "test@test.com")
    expect { user.save }.to change { User.count }.by(1)
  end
  
  it "raises an error with an email" do
    user = User.new
    expect { user.save! }.to raise_error(
      ActiveRecord::RecordInvalid
    )
  end
  
  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:email) }
  
end
