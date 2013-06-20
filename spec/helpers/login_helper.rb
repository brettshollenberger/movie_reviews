def valid_login
  visit(root_path)
  click_link("LOGIN")
  fill_in 'Email', :with => general_user.email
  fill_in 'Password', :with => general_user.password
  click_button("Sign in")
end
