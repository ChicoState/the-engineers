Given /^a user visits the design page "([^"]*)"$/ do |design_signup_page|
	visit design_signup_page
end

#Page Content Link
Then /^on the signup page there should be the logo "([^"]*)"$/ do |logo|
       page.should have_content logo
end       

And /^on the signup page there should be a link to Browse$/ do
	page.should have_content "Browse"
end

And /^on the signup page there should be a link to Create$/ do
	page.should have_content "Create"
end

And /^on the signup page there should be a link to Upload$/ do
	page.should have_content "Upload"
end

And /^on the signup page there should be a link to Login$/ do
	page.should have_content "Login"
end

And /^on the signup page there should be a link to About$/ do
	page.should have_content "About"
end

And /^on the signup page there should be a link to Contact$/ do
	page.should have_content "Contact"
end

And /^on the signup page there should be a link to Legal$/ do
	page.should have_content "Legal"
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

