require 'spec_helper'

include Warden::Test::Helpers
Warden.test_mode!

feature "user can enter review from movies page" do
  background do
    general_user = FactoryGirl.create(:general_user)
    movie = FactoryGirl.create(:movie)
    login_as(general_user, :scope => :user)
  end

  scenario "normal user logged orn" do
    visit root_path
    click_link "Good Burger Hunting"
    expect(page).to have_content("Reviews")
    fill_in_form_with_valid_attributes
    expect(page).to have_content("Soo grood")
    expect(page).to have_content("Review created")
  end

  # scenario "not logged in yet" do
  #   logout(:user)
  #   visit root_path
  #   click_link "Good Burger Hunting"
  #   fill_in_form_with_valid_attributes
  #   expect(page).to have_content("Sign in")
  #   sign_in_as_valid_user
  #   expect(page).to have_content("Soo grood")
  # end

  def fill_in_form_with_valid_attributes
    fill_in "Content", with: "Soo grood"
    fill_in "Score", with: "5"
    click_button "Create Review"
  end

  def sign_in_as_valid_user
    fill_in "Email", with: "brett.shollenberger@gmail.com"
    fill_in "Password", with: "foobar29"
    click_button "Sign in"
  end
end
