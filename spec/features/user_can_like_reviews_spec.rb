require 'spec_helper'

include Warden::Test::Helpers
Warden.test_mode!

feature "user can like a review" do

  background do
    @review = FactoryGirl.create(:review)
    @user = FactoryGirl.create(:user)
    login_as(@user, :scope => :user)
    visit movie_path(@review.movie)
  end

  scenario "user hasn't liked the review" do
    expect(page).to_not have_content("1 like")
    click_link "like_review"
    expect(page).to have_content("1 like")
  end

  scenario "user has liked the review already" do
    click_link "like_review"
    expect(page).to have_content("1 like")
    click_link "unlike_review"
    expect(page).to have_content("No one likes this")
  end

end
