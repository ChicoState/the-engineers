Given /^a user visits the user page but has not logged in$/ do
	visit "/u/1"
end

Given /^a logged in user wants to see his account at "([^"]*)"$/ do |user_page|
	visit user_page
end

#Page Content Link
Then /^on the user page there should be the logo "([^"]*)"$/ do |logo|
       page.should have_link logo
end       

Then /^on the user page there should be a link to Browse$/ do
	page.should have_link "Browse"
end

Then /^on the user page there should be a link to Create$/ do
	page.should have_link "Create"
end

Then /^on the user page there should be a link to Upload$/ do
	page.should have_link "Upload"
end

Then /^on the user page there should be a link to My Library$/ do
	page.should have_link "My Library"
end

Then /^on the user page there should be a link to Logout$/ do
	page.should have_link "Logout"
end

Then /^on the user page there should be a link to About$/ do
	page.should have_link "About"
end

Then /^on the user page there should be a link to Contact$/ do
	page.should have_link "Contact"
end

Then /^on the user page there should be a link to Legal$/ do
	page.should have_link "Legal"
end

#Link redirect
But /^then this user will be redirected to the login page$/ do
	page.should have_content "Login"
end

Then /^when the user enters in valid information and goes to the user page$/ do
	fill_in "username",		with: "test"
	fill_in "password", 		with: "test"
	click_button "Login"
	visit "/u/1"
end

Then /^they should see the user page$/ do
	page.should have_content "My Library"
end

And /^so this user clicks on it they should be redirected to the home page$/ do
	click_link "3DEx"
	page.should have_content "Featured Design"
end

And /^so this user clicks on it they should be redirected to the view-all page$/ do
	click_link "Browse"
	page.should have_content "View All Designs"
end

And /^so this user clicks on it they should be redirected to the user create page$/ do
	click_link "Create"
	page.should have_content "Create a User"
end

And /^so this user clicks on it they should be redirected to the my library page$/ do
	click_link "My Library"
	page.should have_content "My Library"
end

And /^so this user clicks on it they should be redirected to the upload page$/ do
	click_link "Upload"
	page.should have_content "Create design"
end

And /^so this user clicks on it they should be redirected to the login page$/ do
	page.should have_content "Logout"
end

#Page Description
Then /^the user should see all his designs$/ do
	page.should have_content "A 3D Tree"
	page.should have_content "Edward Elephanteous"
	page.should have_content "BAT CAT!!!!"
end

And /^below that the descriptions of the designs$/ do
	page.should have_content "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Harum incidunt maxime ducimus repudiandae molestias, quibusdam nostrum cumque minima numquam, eos quod aspernatur vel veritatis corrupti, recusandae beatae! Enim, magni, debitis."
end

And /^a Purchase link$/ do
	page.should have_link "Purchase"
end

And /^a Learn More link$/ do
	page.should have_link "Learn more"
end

And /^his username$/ do
	page.should have_content "test"
end

And /^a info button$/ do
	page.should have_button "Info"
end

And /^a Licenses button$/ do
	page.should have_button "Licenses"
end

