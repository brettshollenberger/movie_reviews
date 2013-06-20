require "spec_helper"

describe "index page" do
  let!(:movie){FactoryGirl.create(:movie)}
  let!(:general_user){FactoryGirl.create(:general_user)}

  it "lists the movie names" do

    valid_login
    click_link ("#{movie.title}")
    expect(page).to have_content("#{movie.description}")
  end
end
