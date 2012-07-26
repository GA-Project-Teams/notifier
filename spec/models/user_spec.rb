require 'spec_helper'

describe User do
  it "requires an email to be valid" do
    u = User.new
    u.valid?.should be_false
  end
end
