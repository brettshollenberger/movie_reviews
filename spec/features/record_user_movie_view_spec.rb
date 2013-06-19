require "spec_helper"

feature "record movie#show that the user views" do

  let!(:user){FactoryGirl.create(:user)}

  let!(:movie){FactoryGirl.create(:movie)}


  scenario "a user visits 1 movie#show pages" do
    visit(root_path)
    click_link("Login")
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_button("Sign in")
    click_link(movie.title)
    expect(user.movies.count).to eql 1
  end

  scenario "a user visits 1 movie#show pages several times" do
    visit(root_path)
    click_link("Login")
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_button("Sign in")
    click_link(movie.title)
    visit(root_path)
    click_link(movie.title)
    visit(root_path)
    click_link(movie.title)
    visit(root_path)
    expect(user.movies.count).to eql 1
  end

end
