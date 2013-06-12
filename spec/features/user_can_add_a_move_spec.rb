require "spec_helper"

describe "add new movie" do 
  it "creates new movie and redirects to show page for new movie" do 
    visit(root_path)
    click_link("add new movie")
    fill_in 'Title', :with => 'real title'
    fill_in 'Description', :with => 'real movie'
    click_button("add movie")
    expect(page).to have_content("real title")
    expect(page).to have_content("real movie")
  end
  it "redirects us to the index page is we fuck up" do 
  end
end 
