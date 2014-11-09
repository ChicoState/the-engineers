Given /^a user wants to edit his information at "([^"]*)"$/ do |user_edit_page|
	visit user_edit_page
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
Then /^they should be redirected to the login page$/ do
	page.should have_content ("Login" || "You're already logged in as ")
end
