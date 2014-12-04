Given /^a user visits the page "([^"]*)" to use the search function$/ do |design_search|
	visit design_search
end

#Page Description
When /^the user gets to the page it should have the search function$/ do
	page.should have_content "Search"
end

And /^the search button$/ do
	page.should have_button "Search"
end

And /^the clear button$/ do
	page.should have_button "Clear"
end

And /^the field Design Name$/ do
	page.should have_field "Design Name"
end

And /^the field Author Name$/ do
	page.should have_field "Author Name"
end


#Page Content Links
Then /^on the search page there should be the logo "([^"]*)"$/ do |logo|
       page.should have_link logo
end       

Then /^on the search page there should be a link to Browse$/ do
	page.should have_link "Browse"
end

Then /^on the search page there should be a link to Create$/ do
	page.should have_link "Create"
end

Then /^on the search page there should be a link to Upload$/ do
	page.should have_link "Upload"
end

Then /^on the search page there should be a link to Login$/ do
	page.should have_link "Login"
end

Then /^on the search page there should be a link to About$/ do
	page.should have_link "About"
end

Then /^on the search page there should be a link to Contact$/ do
	page.should have_link "Contact"
end

Then /^on the search page there should be a link to Legal$/ do
	page.should have_link "Legal"
end

And /^on the search page there should be a link View details$/ do
	page.should have_link "View details"
end


#Link redirect
And /^then a user clicks on it they should be redirected to the home page$/ do
	click_link "3DEx"
	page.should have_content "Featured Design"
end

And /^then a user clicks on it they should be redirected to the view-all page$/ do
	click_link "Browse"
	page.should have_content "View All Designs"
end

And /^then a user clicks on it they should be redirected to the user create page$/ do
	click_link "Create"
	page.should have_content "Create a User"
end

And /^then a user clicks on it and is not logged in they should be redirected to the login page$/ do
	click_link "Upload"
	page.should have_content "Login"
end

When /^they log in with valid user information and click upload$/ do
	fill_in "username",		with: "test"
	fill_in "password",		with: "test"
	click_button "Login"
	click_link "Upload"
end

Then /^they should be redirected to the upload page$/ do
	page.should have_content "Create design"
	click_link "Logout"
end

And /^then a user clicks on it they should be redirected to the login page$/ do
	click_link "Login"
	page.should have_content "Login"
end

And /^then a user clicks on it they should be redirected to the 3D item's design page$/ do
	click_link "A 3D Tree"
	page.should have_content "A 3D Tree"
end

#Searching with specific arguments
When /^the user enters no arguments and clicks search$/ do
	click_button "Search"
end

And /^the search function should be there$/ do
	page.should have_content "Search"
end

When /^the user enters "([^"]*)" into the design name field and clicks search$/ do |a_search|
	fill_in "Design Name",		with: a_search
	click_button "Search"
end

When /^the user enters "([^"]*)" in the design name field and clicks search$/ do |a_3d_tree_search|
	fill_in "Design Name",		with: a_3d_tree_search
	click_button "Search"
end

When /^the user enters "([^"]*)" to the design name field and clicks search$/ do |some_design_not_in_database_search|
	fill_in "Design Name",		with: some_design_not_in_database_search
	click_button "Search"
end

When /^the user enters "([^"]*)" to the author name field and clicks search$/ do |test_search|
	fill_in "Author Name",		with: test_search
	click_button "Search"
end

When /^the user enters "([^"]*)" into the author name field and clicks search$/ do |some_guy_not_in_database_search|
	fill_in "Author Name",		with: some_guy_not_in_database_search
	click_button "Search"
end

When /^the user enters "([^"]*)" into the design name field$/ do |a_3d_tree_search|
	fill_in "Design Name",		with: a_3d_tree_search
end

And /^"([^"]*)" into the author name field and clicks search$/ do |test_search|
	fill_in "Author Name",		with: test_search
	click_button "Search"
end

When /^the user enters "([^"]*)" in the design name field$/ do |some_design_not_in_database_search|
	fill_in "Design Name",		with: some_design_not_in_database_search
end

And /^"([^"]*)" in the author name field and clicks search$/ do |some_guy_not_in_database_search|
	fill_in "Author Name",		with: some_guy_not_in_database_search
	click_button "Search"
end

#Displayed Results
Then /^all designs should be displayed$/ do
	page.should have_content "A 3D Tree"
	page.should have_content "BAT CAT!!!! - Left"
	page.should have_content "Edward Elephanteous"
end

Then /^only the 3D Tree design should be displayed$/ do
	page.should have_content "A 3D Tree"
	page.should_not have_content "BAT CAT!!!!"
	page.should_not have_content "Edward Elephanteous"
end

Then /^no designs should be displayed$/ do
	page.should_not have_content "A 3D Tree"
	page.should_not have_content "BAT CAT!!!!"
	page.should_not have_content "Edward Elephanteous"
end
