require 'spec_helper'

describe Review do
  let(:review) { FactoryGirl.create(:review) }

  it "is valid" do
    expect(review).to be_valid
  end

  it "is not valid without a user" do
    review.user = nil
    expect(review).to_not be_valid
  end

  it "is not valid without content" do
    review.content = nil
    expect(review).to_not be_valid
  end

  it "is not valid without a score" do
    review.score = nil
    expect(review).to_not be_valid
  end

  it "is not valid without a movie" do
    review.movie = nil
    expect(review).to_not be_valid
  end

  it "is only valid with a score between 1 and 5" do
    review.score = 0
    expect(review).to_not be_valid
    review.score = 20
    expect(review).to_not be_valid
    review.score = "chinatown"
    expect(review).to_not be_valid
  end

end
