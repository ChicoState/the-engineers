Given /^a user visits the edit user page but has not logged in$/ do
	visit "/u/view"
end

Given /^a logged in user wants to edit his information at "([^"]*)"$/ do |user_edit_page|
	visit user_edit_page
end

#Page Content Link
Then /^on the edit user page there should be the logo "([^"]*)"$/ do |logo|
       page.should have_link logo
end       

Then /^on the edit user page there should be a link to Browse$/ do
	page.should have_link "Browse"
end

Then /^on the edit user page there should be a link to Create$/ do
	page.should have_link "Create"
end

Then /^on the edit user page there should be a link to Upload$/ do
	page.should have_link "Upload"
end

Then /^on the edit user page there should be a link to My Library$/ do
	page.should have_link "My Library"
end

Then /^on the edit user page there should be a link to Logout$/ do
	page.should have_link "Logout"
end

Then /^on the edit user page there should be a link to About$/ do
	page.should have_link "About"
end

Then /^on the edit user page there should be a link to Contact$/ do
	page.should have_link "Contact"
end

Then /^on the edit user page there should be a link to Legal$/ do
	page.should have_link "Legal"
end

#Link redirect
Then /^this user will be redirected to the login page$/ do
	page.should have_content "Login"
end

But /^when the user enters in valid information and goes to the edit user page$/ do
	fill_in "username",		with: "test"
	fill_in "password", 		with: "test"
	click_button "Login"
	visit "/u/view"
end

Then /^they should see the edit user page$/ do
	page.should have_content "Profile Settings"
end

When /^the user clicks on it they should be redirected to the home page$/ do
	click_link "3DEx"
	page.should have_content "Featured Design"
end

When /^the user clicks on it they should be redirected to the view-all page$/ do
	click_link "Browse"
	page.should have_content "View All Designs"
end

When /^the user clicks on it they should be redirected to the user create page$/ do
	click_link "Create"
	page.should have_content "Create a User"
end

When /^the user clicks on it they should be redirected to the my library page$/ do
	click_link "My Library"
	page.should have_content "My Library"
end

When /^the user clicks on it they should be redirected to the upload page$/ do
	click_link "Upload"
	page.should have_content "Create design"
end

When /^the user clicks on it they should be redirected to the login page$/ do
	page.should have_content "Logout"
end

#Test with invalid information
When /^they edit with no email$/ do
	fill_in "password",		with: "1234"
	fill_in "confirm_password",	with: "1234"
	click_button "Save Changes!"
end

When /^they edit using their own email as a new email$/ do
	fill_in "email",		with: "jkrepelka@mail.csuchico.edu"
	fill_in "password",		with: "1234"
	fill_in "confirm_password",	with: "1234"
	click_button "Save Changes!"
end

When /^they edit using another user's email as a new email$/ do
	fill_in "email",		with: "jkrepelka@mail.csuchico.edu"
	fill_in "password",		with: "1234"
	fill_in "confirm_password",	with: "1234"
	click_button "Save Changes!"
end

When /^they edit their password but their confirmation password is different$/ do
	fill_in "email",		with: "hello@mail.csuchico.edu"
	fill_in "password",		with: "1234"
	fill_in "confirm_password",	with: "4321"
	click_button "Save Changes!"
end

When /^they edit their password but there is no confirmation password$/ do
	fill_in "email",		with: "hello@mail.csuchico.edu"
	fill_in "password",		with: "1234"
	click_button "Save Changes!"
end

When /^they edit their password but there is no password$/ do
	fill_in "email",		with: "hello@mail.csuchico.edu"
	fill_in "confirm_password",		with: "1234"
	click_button "Save Changes!"
end

When /^they edit their password but their password and confirmation password do not have more than 3 characters$/ do
	fill_in "email",		with: "hello@mail.csuchico.edu"
	fill_in "password",		with: "123"
	fill_in "confirm_password",	with: "123"
	click_button "Save Changes!"
end

#Test with valid information
When /^they edit with a valid email, password, and confirmation password$/ do
	fill_in "username",		with: "test"
	fill_in "password",		with: "test"
	click_button "Login"

	visit "/u/view"

	fill_in "email",		with: "hello@mail.csuchico.edu"
	fill_in "password",		with: "1234"
	fill_in "confirm_password",	with: "1234"
	click_button "Save Changes!"
end

#Error messages
Then /^they should see the email error "([^"]*)"$/ do |email_error|
	page.should have_content email_error
end

Then /^they should see another email error "([^"]*)"$/ do |another_email_error|
	page.should have_content another_email_error
end

Then /^they should see a password error "([^"]*)"$/ do |password_error|
	page.should have_content password_error
end

Then /^they should see another password error "([^"]*)"$/ do |another_password_error|
	page.should have_content another_password_error
end

#Success
Then /^they should be redirected to the user account page$/ do
	page.should have_content "test"
end
