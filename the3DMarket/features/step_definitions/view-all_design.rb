Given /^a user visits the "([^"]*)"$/ do |view_all|
	visit view_all
end

#Page Content Links
Then /^on the view-all page there should be the logo "([^"]*)"$/ do |logo|
       page.should have_content logo
end       

And /^on the view-all page there should be a link to Browse$/ do
	page.should have_content "Browse"
end

And /^on the view-all page there should be a link to Create$/ do
	page.should have_content "Create"
end

And /^on the view-all page there should be a link to Upload$/ do
	page.should have_content "Upload"
end

And /^on the view-all page there should be a link to Login$/ do
	page.should have_content "Login"
end

And /^on the view-all page there should be a link to About$/ do
	page.should have_content "About"
end

And /^on the view-all page there should be a link to Contact$/ do
	page.should have_content "Contact"
end

And /^on the view-all page there should be a link to Legal$/ do
	page.should have_content "Legal"
end

And /^on the view-all page there should be a link to Purchase$/ do
	page.should have_link "Purchase"
end

And /^on the view-all page there should be a link to Learn more$/ do
	page.should have_link "Learn more"
end

#Page Content Title
And /^on the view-all page there should be the title "([^"]*)"$/ do |title|
       page.should have_content title
end       

And /^on the view-all page there should be the 3D design title "([^"]*)"$/ do |design_title|
       page.should have_content design_title
end       

#Page Content 3D description
And /^on the view-all page underneath the 3D design title, there should be a description of the 3D model$/ do
	page.should have_content "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Harum incidunt maxime ducimus repudiandae molestias, quibusdam nostrum cumque minima numquam, eos quod aspernatur vel veritatis corrupti, recusandae beatae! Enim, magni, debitis."
end

#Page Content 3D image
And /^on the view-all page there should be a 3D image of the 3D Tree$/ do
	page.should have_xpath("imgs/2.jpg")
end
