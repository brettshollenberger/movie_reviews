require 'spec_helper'

include Warden::Test::Helpers
Warden.test_mode!

feature "admin can login" do
  background do
    @review = FactoryGirl.create(:review)
    @user = FactoryGirl.create(:suspended_user)
  end

  scenario "suspended user attempts to login" do
    login_as(@user, :scope => :user)
    visit root_path
    click_link @review.movie.title
    expect(page).to have_content("You must Login to review a movie")
  end

end
