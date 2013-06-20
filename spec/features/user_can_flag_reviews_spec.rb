require 'spec_helper'

include Warden::Test::Helpers
Warden.test_mode!

feature "user can flag reviews as inappropriate" do
  background do
    @review = FactoryGirl.create(:review)
    @admin = FactoryGirl.create(:admin)
    login_as(@admin, :scope => :user)
  end

  scenario "user flags review" do
    visit root_path
    click_link "#{@review.movie.title}"
    click_link "Flag Review"
    expect(page).to have_content("Review flagged")
  end
end
