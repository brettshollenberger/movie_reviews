require 'spec_helper'

include Warden::Test::Helpers
Warden.test_mode!

feature "user can like a comment" do

  background do
    @comment = FactoryGirl.create(:comment)
    @user = FactoryGirl.create(:user)
    login_as(@user, :scope => :user)
    visit movie_path(@comment.movie)
  end

  scenario "user hasn't liked the comment" do
    expect(page).to_not have_content("1 like")
    click_link "movie[like]"
    expect(page).to have_content("1 like")
  end

  scenario "user has liked the comment already" do
    click_link "movie[like]"
    expec(page).to have_content("1 like")
    click_link "movie[unlike]"
    expect(page).to have_content("No one likes this")
  end

end
