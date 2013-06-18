require 'spec_helper'

describe Like do
  let(:like) { FactoryGirl.create(:like) }

  it "is valid" do
    expect(like).to be_valid
  end

  it { should validate_presence_of(:likable) }
  it { should validate_presence_of(:likable_id) }
  it { should validate_presence_of(:likable_type) }
end
