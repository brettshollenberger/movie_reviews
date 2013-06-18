require 'spec_helper'

include Warden::Test::Helpers
Warden.test_mode!

feature "user can like a movie" do

  background do
    @movie = FactoryGirl.create(:movie)
    @user = FactoryGirl.create(:user)
    login_as(@user, :scope => :user)
    visit movie_path(@movie)
  end

  scenario "user hasn't liked the movie" do
    expect(page).to have_content("No one likes this")
    click_link "Like"
    expect(page).to have_content("1 like")
  end

  scenario "user has liked the movie already" do
    click_link "Like"
    expect(page).to have_content("1 like")
    click_link "Unlike"
    expect(page).to have_content("No one likes this")
  end

end
