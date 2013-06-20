require 'spec_helper'

describe User do
  let(:general_user)  { FactoryGirl.build(:general_user) }
  let(:admin) { FactoryGirl.build(:admin) }
  it "should be valid" do
    expect(general_user).to be_valid
  end

  it "should not be valid if there is no email" do
    general_user.email = nil
    expect(general_user).to_not be_valid
  end

  it "should not be valid if they do not have a password" do
    general_user.password = nil
    expect(general_user).to_not be_valid
  end

  it "is by default not an admin user" do
    expect(general_user.admin).to be_false
  end

  it "has a default status of ok" do
    expect(general_user.status).to eql("ok")
  end

  describe "admin?" do

    it "validates the admin status of a user" do
      expect(general_user.admin?).to be_false
      expect(admin.admin?).to be_true
    end
  end
end
