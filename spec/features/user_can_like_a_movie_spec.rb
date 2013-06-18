require 'spec_helper'

include Warden::Test::Helpers
Warden.test_mode!

feature "user can like a movie" do

  background do
    movie = FactoryGirl.create(:movie)
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
  end

  scenario "user hasn't liked the movie" do
  end

end
