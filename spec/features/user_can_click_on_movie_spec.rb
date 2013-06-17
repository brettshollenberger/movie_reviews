require "spec_helper"

describe "index page" do
  let!(:movie){FactoryGirl.create(:movie)}
  let!(:user){FactoryGirl.create(:user)}

  it "lists the movie names" do

    visit(root_path)
    click_link("login")
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_button("Sign in")
    click_link ("#{movie.title}")
    expect(page).to have_content("#{movie.description}")
  end
end
