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
    expect { user = FactoryGirl.create(:user) }.to change { User.count }.by(1)
  end
  
  it "raises an error without an email" do
    user = User.new
    expect { user.save! }.to raise_error(
      ActiveRecord::RecordInvalid
    )
  end
  
  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:email) }
  it { should respond_to(:company_name) }
  it { should respond_to(:phone_number) }
  it { should respond_to(:preference) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
  it { should validate_presence_of :email }
  it { should validate_presence_of :company_name }
  it { should validate_presence_of :password }
 # it { should validate_presence_of :password_confirmation } #TODO: Not sure what enable_strict_validation
  
end
