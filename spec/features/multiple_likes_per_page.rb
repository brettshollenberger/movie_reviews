require 'spec_helper'

include Warden::Test::Helpers
Warden.test_mode!

feature "user can like movies and reviews on the same page" do

  background do
    @review = FactoryGirl.create(:review)
    @movie = @review.movie
    @general_user = FactoryGirl.create(:general_user)
    login_as(@general_user, :scope => :user)
    visit movie_path(@review.movie)
  end

  scenario "user hasn't liked either" do
    click_link "like_review"
    expect(page).to have_content("1 like")
    expect(page).to have_content("No one likes this")
  end

  scenario "playing with liking multiple objects" do
    click_link "like_review"
    expect(page).to have_content("1 like")
    click_link "like_review"
    expect(page).to have_content("No one likes this")
    click_link "dislike_movie"
    expect(page).to have_content("1 dislike")
    expect(page).to have_content("1 like")
    click_link "dislike_review"
    click_link "dislike_review"
    expect(page).to_not have_content("1 like")
    expect(page).to_not have_content("No one likes this")
  end

end
