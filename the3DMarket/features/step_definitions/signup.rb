Given /^a user visits the Signup page "([^"]*)"$/ do |webpage|
	visit webpage
end

And /^they go back to the Signup page$/ do
	visit "/u/create"
end

#Invalid information provided
When /^they sign up with no username$/ do
	fill_in "email",		with: "1@1.com"
	fill_in "password",		with: "1234"
	fill_in "confirm_password",	with: "1234"
	click_button "Create!"
end

When /^they sign up with passwords of different lengths$/ do
	fill_in "email",		with: "1@1.com"
	fill_in "username",		with: "Rachael"
	fill_in "password",		with: "1234"
	fill_in "confirm_password",	with: "123"
	click_button "Create!"
end

When /^they sign up with different passwords of the same length$/ do
	fill_in "email",		with: "1@1.com"
	fill_in "username",		with: "Rachael"
	fill_in "password",		with: "1234"
	fill_in "confirm_password",	with: "4321"
	click_button "Create!"
end

When /^they sign up with only confirm_password$/ do
	fill_in "email",		with: "1@1.com"
	fill_in "username",		with: "Rachael"
	fill_in "confirm_password",	with: "1234"
	click_button "Create!"
end

When /^they sign up with only password$/ do
	fill_in "email",		with: "1@1.com"
	fill_in "username",		with: "Rachael"
	fill_in "password",		with: "1234"
	click_button "Create!"
end

When /^they sign up with the username "(.*?)"$/ do |username|
	fill_in "email",		with: "2@2.com"
	fill_in "username",		with: username
	fill_in "password",		with: "1234"
	fill_in "confirm_password",	with: "1234"
	click_button "Create!"
end

When /^they sign up with a password under 4 characters$/ do
	fill_in "email",		with: "1@1.com"
	fill_in "username",		with: "Ned"
	fill_in "password",		with: "123"
	fill_in "confirm_password",	with: "123"
	click_button "Create!"
end

When /^they sign up with no password and confirm_password$/ do
	fill_in "email",		with: "1@1.com"
	fill_in "username",		with: "Ned"
	click_button "Create!"
end

When /^they sign up with symbols for the username "(.*?)"$/ do |symbols|
	fill_in "email",		with: "1234@gmail.com"
	fill_in "username",		with: symbols
	fill_in "password",		with: "1234"
	fill_in "confirm_password",	with: "1234"
	click_button "Create!"
end

When /^they sign up with a really long username "(.*?)"$/ do |long_name|
	fill_in "email",		with: "12345@gmail.com"
	fill_in "username",		with: long_name
	fill_in "password",		with: "1234"
	fill_in "confirm_password",	with: "1234"
	click_button "Create!"
end

When /^they sign up with spaces in the username "(.*?)"$/ do |space|
	fill_in "email",		with: "123456@gmail.com"
	fill_in "username",		with: space
	fill_in "password",		with: "1234"
	fill_in "confirm_password",	with: "1234"
	click_button "Create!"
end

When /^they sign up with an email for the username "(.*?)"$/ do |email|
	fill_in "email",		with: "123456@gmail.com"
	fill_in "username",		with: email
	fill_in "password",		with: "1234"
	fill_in "confirm_password",	with: "1234"
	click_button "Create!"
end


And /^try to create the user "(.*?)"$/ do |username|
	fill_in "email",		with: "2@2.com"
	fill_in "username",		with: username
	fill_in "password",		with: "1234"
	fill_in "confirm_password",	with: "1234"
	click_button "Create!"
end

#Valid information Provided
When /^they sign up with an email, username, valid password, and valid confirm_password$/ do
	fill_in "email",		with: "1@1.com"
	fill_in "username",		with: "Ned"
	fill_in "password",		with: "1234"
	fill_in "confirm_password",	with: "1234"
	click_button "Create!"
end

When /^they sign up with a username, valid password, valid confirm_password and no email$/ do
	fill_in "email",		with: "3@3.com"
	fill_in "username",		with: "Nedd"
	fill_in "password",		with: "1234"
	fill_in "confirm_password",	with: "1234"
	click_button "Create!"
end

#Errors
Then /^they should see the user error "(.*?)"$/ do |username_error|
	page.should have_content username_error
end

Then /^they should see the password error "(.*?)"$/ do |password_error|
	page.should have_content password_error
end

Then /^they should see the database error "(.*?)"$/ do |database_error|
	page.should have_content database_error
end

Then /^they should see the short password error "(.*?)"$/ do |short_error|
	page.should have_content short_error
end

Then /^they should not be able to create the user$/ do
	page.should have_content "Create a User"
end

#Success
Then /^the sign up was a success and they should not be in the signup page$/ do
	page.should_not have_title "Create a User"
end
