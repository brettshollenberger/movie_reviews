require 'spec_helper'

describe Like do
  let!(:like_for_movies)  { FactoryGirl.create(:like) }
  # let(:like_for_reviews) { FactoryGirl.create(:like_for_reviews) }

  it "is valid" do
    expect(like_for_movies).to be_valid
  #   expect(like_for_reviews).to be_valid
  end

  # it "validates" do
  #   expect(like_for_movies).to validate_presence_of(:user)
  #   expect(like_for_movies).to validate_presence_of(:likable)
  #   expect(like_for_movies).to validate_presence_of(:likable_id)
  #   expect(like_for_movies).to validate_presence_of(:likable_type)
  # end
end
