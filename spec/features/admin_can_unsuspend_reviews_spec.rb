require 'spec_helper'

include Warden::Test::Helpers
Warden.test_mode!

feature "admin can unsuspend reviews" do
  background do
    @review = FactoryGirl.create(:suspended)
    @admin = User.find(@review.user_id)
    @admin.admin = true
    login_as(@admin, :scope => :user)
  end

  scenario "admin views suspended review" do
    visit admin_index_path
    click_link @admin.email
    expect(page).to have_content("Suspended")
  end

  scenario "admin unsuspends suspended review" do
    visit admin_index_path
    click_link @admin.email
    click_link "Lift Suspension"
    expect(page).to have_content("Suspension lifted")
    expect(page).to have_content("Status: Ok")
  end
end
