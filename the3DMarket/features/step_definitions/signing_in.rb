Given /^a user visits the Login page$/ do
	visit "/login"
end

#Log in with invalid information
When /^they submit an email for the username$/ do
	fill_in "username",	with: "test@mail.csuchico.edu"
	fill_in "password",	with: "failpassword"
	click_button "Login"
end

When /^they submit "(.*?)" for the username$/ do |symbols|
	fill_in "username",	with: symbols
	fill_in "password",	with: "failpassword"
	click_button "Login"
end

When /^they submit the username "(.*?)"$/ do |long_username|
	fill_in "username",	with: long_username
	fill_in "password",	with: "ffff"
	click_button "Login"
end

When /^they submit spaces in the username$/ do
	fill_in "username",	with: "test test test"
	fill_in "password",	with: "failpassword"
	click_button "Login"
end

When /^they submit no information for the username and password$/ do
	click_button "Login"
end

When /^they submit a space for the username$/ do
	fill_in "username",	with: " "
	fill_in "password",	with: "failpassword"
	click_button "Login"
end

When /^they submit a password under 4 characters$/ do
	fill_in "username",	with: "()()()("
	fill_in "password",	with: " "
	click_button "Login"
end

#error message
Then /^they should see an error message$/ do
	page.should have_content "The username or password specified was incorrect."
end

#Log in with valid information
When /^they submit a user information that is in the database$/ do
	fill_in "username",	with: "test"
	fill_in "password",	with: "test"
	click_button "Login"
end

Then /^they should see the logout page$/ do
	page.should have_content "You're already logged in as test"
end
