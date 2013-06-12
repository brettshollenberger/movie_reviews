require 'spec_helper'

describe User do
  let(:user) {FactoryGirl.build(:user)}
  it "should be valid" do
    expect(user).to be_valid
  end

  it "should not be valid if there is no email" do
    user.email = nil
    expect(user).to_not be_valid
  end

  it "should not be valid if they do not have a password" do
    user.password = nil
    expect(user).to_not be_valid
  end

  it "is be default not an admin user" do
    expect(user.admin).to be_false
  end
end
