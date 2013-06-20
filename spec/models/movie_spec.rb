require 'spec_helper'

describe Movie do
  it { should validate_uniqueness_of(:title)}
  it { should validate_presence_of(:title)}
  it { should validate_uniqueness_of(:description)}
  it { should validate_presence_of(:description)}


  describe "self.recent_three" do
    let!(:movie1) {FactoryGirl.create(:movie)}
    let!(:movie2) {FactoryGirl.create(:movie)}
    let!(:movie3) {FactoryGirl.create(:movie)}
    let!(:movie4) {FactoryGirl.create(:movie, created_at: 1.year.ago)}
    it "returns the most recent three movies" do
      recent_movie = Movie.recent_three
      expect(recent_movie.size).to eql(3)
      expect(recent_movie).to_not include(movie4)
    end
  end
end
