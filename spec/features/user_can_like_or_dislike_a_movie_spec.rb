require 'spec_helper'

include Warden::Test::Helpers
Warden.test_mode!

feature "user can like or dislike a movie" do

  background do
    @movie = FactoryGirl.create(:movie)
    @user = FactoryGirl.create(:user)
    login_as(@user, :scope => :user)
    visit movie_path(@movie)
  end

  scenario "user hasn't liked the movie" do
    expect(page).to have_content("No one likes this")
    click_link "like_movie"
    expect(page).to have_content("1 like")
  end

  scenario "user has liked the movie already" do
    click_link "like_movie"
    expect(page).to have_content("1 like")
    click_link "dislike_movie"
    expect(page).to have_content("No one likes this")
  end

  scenario "user can dislike the movie" do
    click_link "dislike_movie"
    expect(page).to have_content("1 dislike")
  end

  scenario "user has already disliked the movie" do
    click_link "dislike_movie"
    expect(page).to have_content("1 dislike")
    click_link "like_movie"
    expect(page).to have_content("No one likes this")
  end

  scenario "user can like or dislike the movie at will!" do
    click_link "like_movie"
    expect(page).to have_content("1 like")
    click_link "dislike_movie"
    expect(page).to have_content("No one likes this")
    click_link "dislike_movie"
    expect(page).to have_content("1 dislike")
    click_link "dislike_movie"
    expect(page).to have_content("1 dislike")
  end

end
