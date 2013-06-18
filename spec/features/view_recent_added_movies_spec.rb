require "spec_helper"

feature "display recent 3 movies added to library" do
  before :each do
    FactoryGirl.create_list(:movie, 10)
  end

  scenario "more than 3 movies are a added" do
    visit(root_path)
    recent_movies = Movie.find(:all, :order => "created_at DESC", :limit=>3)

    recent_movies.each do |movie|
      expect(page).to have_content(movie.title)
    end

  end
end