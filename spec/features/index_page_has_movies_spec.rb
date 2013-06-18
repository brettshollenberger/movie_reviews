require "spec_helper"

describe "index page" do
  let!(:movie){FactoryGirl.create(:movie)}
  let!(:user){FactoryGirl.create(:user)}

  it "lists the movie names" do
    visit(root_path)
    click_link("Login")
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_button("Sign in")
    expect(page).to have_content("#{movie.title}")
  end
end
