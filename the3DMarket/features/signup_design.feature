Feature: Sign up Design

	Scenario: Page Features

		Given a user is not logged in and tries to access the design signup page
		Then the user will be redirected to the login page
		And when the user signs up with valid information and visits the signup page
		Then the user should see the signup page

		Given a user is signed in and visits the "/d/create"
		Then on the signup page there should be the logo "3DEx"
		And when the user clicks on it they should be redirected to the home page

		Given a user is signed in and visits the "/d/create"
		Then on the signup page there should be a link to Browse
		And when the user clicks on it they should be redirected to the view-all page

		Given a user is signed in and visits the "/d/create"
		Then on the signup page there should be a link to Create
		And when the user clicks on it they should be redirected to the user create page

		Given a user is signed in and visits the "/d/create"
		Then on the signup page there should be a link to Upload
		And when the user clicks on it they should be redirected to the upload page

		Given a user is signed in and visits the "/d/create"
		Then on the signup page there should be a link to My Library
		And when the user clicks on it they should be redirected to the my library page
		Given a user is signed in and visits the "/d/create"
		Then on the signup page there should be a link to Logout
		And when the user clicks on it they should be redirected to the login page

		Given a user is signed in and visits the "/d/create"
		Then on the signup page there should be a link to About

		Given a user is signed in and visits the "/d/create"
		Then on the signup page there should be a link to Contact

		Given a user is signed in and visits the "/d/create"
		Then on the signup page there should be a link to Legal

		Given a user is signed in and visits the "/d/create"
		And on the signup page there should be the title "Create design"

		And on the signup page there should be the field Design title
		And on the signup page there should be the field Short description of your design

		And on the signup page there should be the button for STL file
		And on the signup page there should be the button for Image file
		And on the signup page there should be the button for Upload

