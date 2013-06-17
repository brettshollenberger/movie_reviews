require "spec_helper"

describe "add new movie" do 

  let!(:user){FactoryGirl.create(:user)}

  it "creates new movie and redirects to show page for new movie" do 
    visit(root_path)
    click_link("login")
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_button("Sign in")
    click_link("add new movie")
    fill_in 'Title', :with => 'real title'
    fill_in 'Description', :with => 'real movie'
    click_button("add movie")
    expect(page).to have_content("real title")
    expect(page).to have_content("real movie")
  end
end 
