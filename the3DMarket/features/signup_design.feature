Feature: Sign up Design

	Scenario: Page Features

		Given a user visits the design page "/d/create"
		Then on the signup page there should be the logo "3DEx"
		And on the signup page there should be a link to Browse
		And on the signup page there should be a link to Create
		And on the signup page there should be a link to Upload
		And on the signup page there should be a link to Login
		And on the signup page there should be a link to About
		And on the signup page there should be a link to Contact
		And on the signup page there should be a link to Legal

		And on the signup page there should be the title "Create design"

		And on the signup page there should be the field Design title
		And on the signup page there should be the field Short description of your design

		And on the signup page there should be the button for STL file
		And on the signup page there should be the button for Image file
		And on the signup page there should be the button for Upload

