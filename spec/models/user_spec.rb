require 'spec_helper'

describe User do
  let(:user) {FactoryGirl.build(:user)}
  it "should be valid" do
    expect(user).to be_valid
  end

  it "is be default not an admin user" do
    expect(user.admin).to be_false
  end

  it { should validate_presence_of(:password) }

  it { should validate_presence_of(:email) }


  it {should have_many(:viewed_movies).dependent(:destroy)}

  it {should have_many(:movies).through(:viewed_movies)}

  describe "#last thee movies viewed" do   

    let(:user_bob){FactoryGirl.create(:user)}
    let!(:movie1){FactoryGirl.create(:viewed_movie, user: user_bob)}
    let!(:movie2){FactoryGirl.create(:viewed_movie, user: user_bob)}
    let!(:movie3){FactoryGirl.create(:viewed_movie, user: user_bob)}
    let!(:movie_old){FactoryGirl.create(:viewed_movie, user: user_bob, created_at: 1.year.ago)}

    it "returns 3 movies" do
      recent_viewed_movies = user_bob.last_three_movies_viewed

      expect(recent_viewed_movies.count).to be 3
      expect(recent_viewed_movies).to_not include(movie_old)
    end
  end

end
