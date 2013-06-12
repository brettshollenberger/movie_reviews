require "spec_helper"

describe "index page" do
  let!(:movie){FactoryGirl.create(:movie)}

  it "lists the movie names" do
    visit(root_path)
    expect(page).to have_content("#{movie.title}")
  end
end