 require "spec_helper"

feature "user will login" do

  let!(:general_user){ FactoryGirl.create(:general_user) }

  scenario "user already has account, wants to login" do
    valid_login
    expect(page).to have_content("Signed in successfully")
  end
end
