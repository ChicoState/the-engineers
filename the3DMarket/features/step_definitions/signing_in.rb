Given /^a user visits the Login page$/ do
	visit "/login"
end

#Log in with invalid information
When /^they submit invalid information$/ do
	fill_in "username",	with: "127.0.0.1"
	fill_in "password",	with: "failpassword"
	click_button "Log In!"
end

When /^they submit invalid information_2$/ do
	fill_in "username",	with: "test@mail.csuchico.edu"
	fill_in "password",	with: "failpassword"
	click_button "Log In!"
end

When /^they submit invalid information_3$/ do
	fill_in "username",	with: "~!@#$%^&*()_+=-`,./<>?;':[]\|}{"
	fill_in "password",	with: "failpassword"
	click_button "Log In!"
end

When /^they submit invalid information_4$/ do
	fill_in "username",	with: "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
	fill_in "password",	with: "f"
	click_button "Log In!"
end

When /^they submit invalid information_5$/ do
	fill_in "username",	with: "test test test"
	fill_in "password",	with: "failpassword"
	click_button "Log In!"
end

When /^they submit invalid information_6$/ do
	fill_in "username",	with: ""
	fill_in "password",	with: ""
	click_button "Log In!"
end

When /^they submit invalid information_7$/ do
	fill_in "username",	with: " "
	fill_in "password",	with: "failpassword"
	click_button "Log In!"
end

When /^they submit invalid information_8$/ do
	fill_in "username",	with: "()()()("
	fill_in "password",	with: "failpassword"
	click_button "Log In!"
end

When /^they submit invalid information_9$/ do
	fill_in "username",	with: ".,;:'"""
	fill_in "password",	with: "failpassword"
	click_button "Log In!"
end

Then /^they should see an error message$/ do
	page.should have_content "A user with that password was not found"
end

#Log in with valid information
When /^they submit valid information$/ do
	fill_in "username",	with: "test"
	fill_in "password",	with: "test"
	click_button "Log In!"
end

When /^they submit valid information_2$/ do
	fill_in "username",	with: "123456789"
	fill_in "password",	with: "test"
	click_button "Log In!"
end

When /^they submit valid information_3$/ do
	fill_in "username",	with: "ViVaNcE"
	fill_in "password",	with: "test"
	click_button "Log In!"
end

When /^they submit valid information_4$/ do
	fill_in "username",	with: "Under_Score-"
	fill_in "password",	with: "test"
	click_button "Log In!"
end

When /^they submit valid information_5$/ do
	fill_in "username",	with: "Period."
	fill_in "password",	with: "test"
	click_button "Log In!"
end

Then /^they should see the logout page$/ do
	page.should have_content "Logout"
end