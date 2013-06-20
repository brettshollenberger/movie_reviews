require 'spec_helper'

include Warden::Test::Helpers
Warden.test_mode!

feature "admin can suspend user accounts" do
  background do
    @review = FactoryGirl.create(:flagged)
    @admin = FactoryGirl.create(:admin)
    @admin.admin = true
    login_as(@review.user, :scope => :user)
    logout(@review.user)
    login_as(@admin, :scope => :user)
  end

  scenario "admin suspends account" do
    visit admin_index_path
    click_link @review.user.email
    click_link "Suspend Account"
    expect(page).to have_content("Account suspended")
    expect(page).to have_content("User Status: Suspended")
  end
end
