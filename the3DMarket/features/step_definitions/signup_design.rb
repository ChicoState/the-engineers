Given /^a user is signed in and visits the "([^"]*)"$/ do |design_signup_page|
	visit design_signup_page
end

Given /^a user is not logged in and tries to access the design signup page$/ do
	visit "/d/create"
end

#Page Content Link
Then /^on the signup page there should be the logo "([^"]*)"$/ do |logo|
       page.should have_link logo
end       

Then /^on the signup page there should be a link to Browse$/ do
	page.should have_link "Browse"
end

Then /^on the signup page there should be a link to Create$/ do
	page.should have_link "Create"
end

Then /^on the signup page there should be a link to Upload$/ do
	page.should have_link "Upload"
end

Then /^on the signup page there should be a link to My Library$/ do
	page.should have_link "My Library"
end

Then /^on the signup page there should be a link to Logout$/ do
	page.should have_link "Logout"
end

Then /^on the signup page there should be a link to About$/ do
	page.should have_link "About"
end

Then /^on the signup page there should be a link to Contact$/ do
	page.should have_link "Contact"
end

Then /^on the signup page there should be a link to Legal$/ do
	page.should have_link "Legal"
end

#Link redirect
Then /^the user will be redirected to the login page$/ do
	page.should have_content "Login"
end

And /^when the user signs up with valid information and visits the signup page$/ do
	fill_in "username",		with: "test"
	fill_in "password",		with: "test"
	click_button "Login"
	visit "/d/create"
end

Then /^the user should see the signup page$/ do
	page.should have_content "Create design"
end

And /^when the user clicks on it they should be redirected to the home page$/ do
	click_link "3DEx"
	page.should have_content "Featured Design"
end

And /^when the user clicks on it they should be redirected to the view-all page$/ do
	click_link "Browse"
	page.should have_content "View All Designs"
end

And /^when the user clicks on it they should be redirected to the user create page$/ do
	click_link "Create"
	page.should have_content "Create a User"
end

And /^when the user clicks on it they should be redirected to the my library page$/ do
	click_link "My Library"
	page.should have_content "My Library"
end

And /^when the user clicks on it they should be redirected to the upload page$/ do
	click_link "Upload"
	page.should have_content "Create design"
end

And /^when the user clicks on it they should be redirected to the login page$/ do
	page.should have_content "Logout"
end

#Page Content Title 
And /^on the signup page there should be the title "(.*?)"$/ do |signup_title|
	page.should have_content signup_title
end

#Page Content Fields
And /^on the signup page there should be the field Design title$/ do
	page.should have_field "Design title"
end

And /^on the signup page there should be the field Short description of your design$/ do
	page.should have_field "Short description of your design"
end

#Page Content Button
And /^on the signup page there should be the button for STL file$/ do
	page.should have_content "STL file"
end

And /^on the signup page there should be the button for Image file$/ do
	page.should have_content "Image file"
end

And /^on the signup page there should be the button for Upload$/ do
	page.should have_button "Upload"
end

