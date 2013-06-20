require 'spec_helper'

include Warden::Test::Helpers
Warden.test_mode!

feature "admin can suspend reviews" do
  background do
    @review = FactoryGirl.create(:flagged)
    @admin = User.find(@review.user_id)
    @admin.admin = true
    login_as(@admin, :scope => :user)
  end

  scenario "admin views flagged review" do
    visit admin_index_path
    click_link @admin.email
    expect(page).to have_content("Flagged")
  end

  scenario "admin suspends flagged review" do
    visit movie_path(@review.movie)
    expect(page).to have_content(@review.content)
    visit admin_index_path
    click_link @admin.email
    click_link "Suspend Review"
    expect(page).to have_content("Review suspended")
    expect(page).to have_content("Status: Suspended")
    visit movie_path(@review.movie)
    expect(page).to_not have_content(@review.content)
  end
end
