require 'spec_helper'

include Warden::Test::Helpers
Warden.test_mode!

feature "user can enter review from movies page" do
  background do
    review = FactoryGirl.create(:review)
    user = User.find(review.user_id)
    login_as(user, :scope => :user)
  end

  scenario "normal user logged on" do
    visit movies_path
    click_link "Good Burger Hunting"
    expect(page).to have_content("Good Burger Hunting is the best
    moobie I evar sawn today")
    click_link "Edit"
    fill_in_edit_review_attributes
    expect(page).to have_content("Mort Doorman")
    expect(page).to_not have_content("Good Burger Hunting is the best
      moobie I evar sawn today")
  end
end

def fill_in_edit_review_attributes
  fill_in "Content", with: "Mort Doorman"
  fill_in "Score", with: 2
  click_button "Update Review"
end

feature "user cannot edit other users' reviews" do
  background do
    review = FactoryGirl.create(:review)
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
  end

  scenario "normal user logged on" do
    visit movies_path
    click_link "Good Burger Hunting"
    expect(page).to have_content("Good Burger Hunting is the best
    moobie I evar sawn today")
    expect(page).to_not have_link("Edit")
  end
end


