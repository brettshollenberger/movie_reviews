require 'spec_helper'

describe Like do
  let(:like_for_movies)     { FactoryGirl.create(:like_for_movies) }
  let(:like_for_reviews)    { FactoryGirl.create(:like_for_reviews) }
  let(:dislike_for_movies)  { FactoryGirl.create(:dislike_for_movies) }
  let(:dislike_for_reviews) { FactoryGirl.create(:dislike_for_reviews) }

  it "is valid" do
    expect(like_for_movies).to be_valid
    expect(like_for_reviews).to be_valid
    expect(dislike_for_movies).to be_valid
    expect(dislike_for_reviews).to be_valid
  end

  it "validates" do
    expect(like_for_movies).to validate_presence_of(:user)
    expect(like_for_movies).to validate_presence_of(:likable)
    expect(like_for_movies).to validate_presence_of(:polarity)
    expect(like_for_movies).to validate_numericality_of(:polarity)
  end

  it "cannot have a polarity of more than 1" do
    like_for_movies.polarity = 2
    expect(like_for_movies).to_not be_valid
  end

  it "cannot have a polarity of less than -1" do
    dislike_for_movies.polarity = -2
    expect(dislike_for_movies).to_not be_valid
  end

  it "does not allow a user to like the same thing more than once" do
    like_for_movies2 = like_for_movies.dup
    expect(like_for_movies2.save).to eql(false)
  end

  it "does not allow a user to dislike the same thing more than once" do
    dislike_for_movies2 = dislike_for_movies.dup
    expect(dislike_for_movies2.save).to eql(false)
  end
end
