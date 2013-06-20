require 'spec_helper'

feature "shows the users most recent 3 moview reviews that they looked at" do
  let!(:user){FactoryGirl.create(:user)}

  let!(:review){FactoryGirl.create(:review)}

  scenario "A user reads a review" do
    visit (root_path)
    click_link("Login")
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_button("Sign in")
    visit movie_path(review.movie)
    click_link("Read Review")
    expect(user.review.count).to eql(1)
  end

end
