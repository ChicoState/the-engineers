Given /^a user visits the "([^"]*)"$/ do |view_all|
	visit view_all
end

#Page Content Links
Then /^on the view-all page there should be the logo "([^"]*)"$/ do |logo|
       page.should have_link logo
end       

Then /^on the view-all page there should be a link to Browse$/ do
	page.should have_link "Browse"
end

Then /^on the view-all page there should be a link to Create$/ do
	page.should have_link "Create"
end

Then /^on the view-all page there should be a link to Upload$/ do
	page.should have_link "Upload"
end

Then /^on the view-all page there should be a link to Login$/ do
	page.should have_link "Login"
end

Then /^on the view-all page there should be a link to About$/ do
	page.should have_link "About"
end

Then /^on the view-all page there should be a link to Contact$/ do
	page.should have_link "Contact"
end

Then /^on the view-all page there should be a link to Legal$/ do
	page.should have_link "Legal"
end

And /^on the view-all page there should be a link View details$/ do
	page.should have_link "View details"
end

#Link redirect
And /^when a user clicks on it they should be redirected to the home page$/ do
	click_link "3DEx"
	page.should have_content "Featured Design"
end

And /^when a user clicks on it they should be redirected to the view-all page$/ do
	click_link "Browse"
	page.should have_content "View All Designs"
end

And /^when a user clicks on it they should be redirected to the user create page$/ do
	click_link "Create"
	page.should have_content "Create a User"
end

And /^when a user clicks on it and is not logged in they should be redirected to the login page$/ do
	click_link "Upload"
	page.should have_content "Login"
end

But /^when they log in with valid user information and click upload$/ do
	fill_in "username",		with: "test"
	fill_in "password",		with: "test"
	click_button "Login"
	click_link "Upload"
end

Then /^they should be directed to the upload page$/ do
	page.should have_content "Create design"
	click_link "Logout"
end

And /^when a user clicks on it they should be redirected to the login page$/ do
	click_link "Login"
	page.should have_content "Login"
end

And /^when a user clicks on it they should be redirected to the 3D item's design page$/ do
	click_link "A 3D Tree"
	page.should have_content "A 3D Tree"
end

#Page Content Title
And /^on the view-all page there should be the title "([^"]*)"$/ do |title|
       page.should have_content title
end       

And /^on the view-all page there should be the 3D design title "([^"]*)"$/ do |design_title|
       page.should have_content design_title
end       

And /^on the view-all page there should be a search function$/ do
       page.should have_content "Search"
       page.should have_button "Search"
end       

#Page Content 3D description
And /^on the view-all page underneath the 3D design title, there should be a description of the 3D model$/ do
	page.should have_content "So tree-like"
end

#Page Content 3D image
And /^on the view-all page there should be a 3D image of the 3D Tree$/ do
	#page.should have_xpath(@design.filepath)
end
