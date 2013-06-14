require 'spec_helper'

include Warden::Test::Helpers
Warden.test_mode!

feature "user can enter review from movies page" do
  background do
    user = FactoryGirl.create(:user)
    movie = FactoryGirl.create(:movie)
    login_as(user, :scope => :user)
  end

  scenario "normal user logged orn" do
    visit root_path
    click_link "Good Burger Hunting"
    expect(page).to have_content("Reviews")
    fill_in_form_with_valid_attributes
    click_button "Create Review"
    expect(page).to have_content("Soo grood")
    expect(page).to have_content("Review created")
  end

  def fill_in_form_with_valid_attributes
    fill_in "Content", with: "Soo grood"
    fill_in "Score", with: "5"
  end
end
