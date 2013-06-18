require 'spec_helper'

describe Like do
  let(:like_for_movie)  { FactoryGirl.create(:like_for_movie) }
  let(:like_for_review) { FactoryGirl.Create(:like_for_review) }

  it "is valid" do
    expect(like_for_movie).to be_valid
    expect(like_for_review).to be_valid
  end

  it "validates" do
    expect(like_for_movies).to validate_presence_of(:likeable)
    expect(like_for_movies).to validate_presence_of(:likeable_id)
    expect(like_for_movies).to validate_presence_of(:likeable_type)
  end
end
