require 'spec_helper'

include Warden::Test::Helpers
Warden.test_mode!

feature "admin can login" do
  background do
    @review = FactoryGirl.create(:review)
    @admin = User.find(@review.user_id)
    @admin.admin = true
    login_as(@admin, :scope => :user)
  end

  scenario "admin logs in" do
    visit admin_index_path
    expect(page).to have_content("less than a minute ago")
    expect(page).to have_content("1")
    expect(page).to have_content(@admin.email)
  end

  scenario "admin clicks user" do
    visit admin_index_path
    click_link @admin.email
    expect(page).to have_content("Last Login: less than a minute ago")
    expect(page).to have_content("Reviews Count: 1")
    expect(page).to have_content(@review.content)
    expect(page).to have_content("Status: Ok")
  end
end
