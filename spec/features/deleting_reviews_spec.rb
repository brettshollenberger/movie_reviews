require 'spec_helper'

include Warden::Test::Helpers
Warden.test_mode!

feature "user can enter review from movies page" do
  background do
    review = FactoryGirl.create(:review)
    general_user = User.find(review.user_id)
    login_as(general_user, :scope => :user)
  end

  scenario "normal user logged on" do
    visit movies_path
    click_link "Good Burger Hunting"
    expect(page).to have_content("Good Burger Hunting is the best
    moobie I evar sawn today")
    click_link "Delete"
    expect(page).to_not have_content("Good Burger Hunting is the best
    moobie I evar sawn today")
    expect(page).to have_content("Review deleted")
  end
end

feature "user cannot delete other users' reviews" do
  background do
    review = FactoryGirl.create(:review)
    general_user = FactoryGirl.create(:general_user)
    login_as(general_user, :scope => :user)
  end

  scenario "normal user logged on" do
    visit movies_path
    click_link "Good Burger Hunting"
    expect(page).to have_content("Good Burger Hunting is the best
    moobie I evar sawn today")
    expect(page).to_not have_link("Delete")
  end
end
