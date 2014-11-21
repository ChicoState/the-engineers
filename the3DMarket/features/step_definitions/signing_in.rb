Given /^a user visits the Login page$/ do
	visit "/login"
end


#Page Content Link
Then /^on the login page there should be the logo "([^"]*)"$/ do |logo|
       page.should have_link logo
end       

Then /^on the login page there should be a link to Browse$/ do
	page.should have_link "Browse"
end

Then /^on the login page there should be a link to Create$/ do
	page.should have_link "Create"
end

Then /^on the login page there should be a link to Upload$/ do
	page.should have_link "Upload"
end

Then /^on the login page there should be a link to Login$/ do
	page.should have_link "Login"
end

Then /^on the login page there should be a link to About$/ do
	page.should have_link "About"
end

Then /^on the login page there should be a link to Contact$/ do
	page.should have_link "Contact"
end

Then /^on the login page there should be a link to Legal$/ do
	page.should have_link "Legal"
end

#Link redirect
And /^as user clicks on it they should be redirected to the home page$/ do
	click_link "3DEx"
	page.should have_content "Featured Design"
end

And /^as user clicks on it they should be redirected to the view-all page$/ do
	click_link "Browse"
	page.should have_content "View All Designs"
end

And /^as user clicks on it they should be redirected to the user create page$/ do
	click_link "Create"
	page.should have_content "Create a User"
end

And /^as user clicks on it they should be redirected to the login page$/ do
	page.should have_content "Login"
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

Then /^they should see their user account$/ do
	page.should have_content "test"
end
