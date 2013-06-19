 require "spec_helper"

feature "user will login" do

  let!(:user){ FactoryGirl.create(:user) }

  scenario "user already has account, wants to login" do
    valid_login
    expect(page).to have_content("Signed in successfully")
  end
end
