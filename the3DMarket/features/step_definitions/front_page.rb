Given /^a user visits the front page$/ do
	visit "/"
end


#Page Content Links
Then /^on the front page there should be the logo "([^"]*)"$/ do |logo|
       page.should have_link logo
end       

Then /^on the front page there should be a link to Browse$/ do
	page.should have_link "Browse"
end

Then /^on the front page there should be a link to Create$/ do
	page.should have_link "Create"
end

Then /^on the front page there should be a link to Upload$/ do
	page.should have_link "Upload"
end

Then /^on the front page there should be a link to Login$/ do
	page.should have_link "Login"
end

Then /^on the front page there should be a link to About$/ do
	page.should have_link "About"
end

Then /^on the front page there should be a link to Contact$/ do
	page.should have_link "Contact"
end

Then /^on the front page there should be a link to Legal$/ do
	page.should have_link "Legal"
end

#Link redirect
And /^if a user clicks on it they should be redirected to the home page$/ do
	click_link "3DEx"
	page.should have_content "Featured Design"
end

And /^if a user clicks on it they should be redirected to the view-all page$/ do
	click_link "Browse"
	page.should have_content "View All Designs"
end

And /^if a user clicks on it they should be redirected to the user create page$/ do
	click_link "Create"
	page.should have_content "Create a User"
end

And /^if a user clicks on it and is not logged in they should be redirected to the login page$/ do
	click_link "Upload"
	page.should have_content "Login"
end

But /^as the user logs in with valid user information and click upload$/ do
	fill_in "username",		with: "test"
	fill_in "password",		with: "test"
	click_button "Login"
	click_link "Upload"
end

Then /^the user should be redirected to the upload page$/ do
	page.should have_content "Create design"
	click_link "Logout"
end

And /^if a user clicks on it they should be redirected to the login page$/ do
	click_link "Login"
	page.should have_content "Login"
end

Then /^on the front page there should be the title "([^"]*)"$/ do |front_page_title|
       page.should have_content front_page_title
end

And /^the name of the design called "([^"]*)"$/ do |design_title|
	page.should have_content design_title
end

And /^under the name should be a description of the design$/ do
	page.should have_content "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Harum incidunt maxime ducimus repudiandae molestias, quibusdam nostrum cumque minima numquam, eos quod aspernatur vel veritatis corrupti, recusandae beatae! Enim, magni, debitis."
end

And /^there should be a purchase link$/ do
	page.should have_link "Purchase"
end

And /^there should be a learn more link$/ do
	page.should have_link "Learn more"
end
