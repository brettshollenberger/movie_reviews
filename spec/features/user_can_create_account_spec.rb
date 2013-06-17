require "spec_helper"

feature "user can create account" do 

  scenario "new user can create account" do 
    visit(root_path)
    click_link ("Sign up")
    fill_in 'Email', :with => 'blah@blah.com'
    fill_in 'Password', :with => '123234as53' 
    fill_in 'Password confirmation', :with => '123234as53'
    click_button ("Sign up")
    expect(page).to have_content ("Welcome! You have signed up successfully.")
  end



end
