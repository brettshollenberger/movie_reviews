require "spec_helper"

describe "add new movie" do

  let!(:general_user){FactoryGirl.create(:general_user)}

  it "creates new movie and redirects to show page for new movie" do
    valid_login
    click_link("add new movie")
    fill_in 'Title', :with => 'real title'
    fill_in 'Description', :with => 'real movie'
    click_button("Add Movie")
    expect(page).to have_content("real title")
    expect(page).to have_content("real movie")
  end
end
