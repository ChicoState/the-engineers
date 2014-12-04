Given /^a user visits the user library page but has not logged in$/ do
	visit "/u/library"
end

Given /^a logged in user wants to see his library at "([^"]*)"$/ do |library_page|
	visit library_page
end

#Page Content Link
Then /^on the user library page there should be the logo "([^"]*)"$/ do |logo|
       page.should have_link logo
end       

Then /^on the user library page there should be a link to Browse$/ do
	page.should have_link "Browse"
end

Then /^on the user library page there should be a link to Create$/ do
	page.should have_link "Create"
end

Then /^on the user library page there should be a link to Upload$/ do
	page.should have_link "Upload"
end

Then /^on the user library page there should be a link to My Library$/ do
	page.should have_link "My Library"
end

Then /^on the user library page there should be a link to Logout$/ do
	page.should have_link "Logout"
end

Then /^on the user library page there should be a link to About$/ do
	page.should have_link "About"
end

Then /^on the user library page there should be a link to Contact$/ do
	page.should have_link "Contact"
end

Then /^on the user library page there should be a link to Legal$/ do
	page.should have_link "Legal"
end

#Link redirect
And /^then this user should be redirected to the login page$/ do
	page.should have_content "Login"
end

But /^when the user enters in valid information and goes to the user library page$/ do
	fill_in "username",		with: "test"
	fill_in "password", 		with: "test"
	click_button "Login"
	visit "/u/library"
end

Then /^they should see the user library page$/ do
	page.should have_content "My Library"
end

And /^this user clicks on it they should be redirected to the home page$/ do
	click_link "3DEx"
	page.should have_content "Featured Design"
end

And /^this user clicks on it they should be redirected to the view-all page$/ do
	click_link "Browse"
	page.should have_content "View All Designs"
end

And /^this user clicks on it they should be redirected to the user create page$/ do
	click_link "Create"
	page.should have_content "Create a User"
end

And /^this user clicks on it they should be redirected to the my library page$/ do
	click_link "My Library"
	page.should have_content "My Library"
end

And /^this user clicks on it they should be redirected to the upload page$/ do
	click_link "Upload"
	page.should have_content "Create design"
end

And /^this user clicks on it they should be redirected to the login page$/ do
	page.should have_content "Logout"
end

#Page Description
Then /^on the user library page there should be the title "([^"]*)"$/ do |library_title|
       page.should have_content "My Library"
end

And /^all the user's designs should be displayed$/ do
	page.should have_content "A 3D Tree"
	page.should have_content "Edward Elephanteous"
	page.should have_content "BAT CAT!!!!"
end

And /^a description for each design$/ do
	page.should have_content "This is a bat wing for a cat"
	page.should have_content "This is a wing for bats"
	page.should have_content "The Elelelelelephant"
	page.should have_content "So tree-like"
end

And /^there should be a View Details link under each design$/ do
	page.should have_link "View details"
end
