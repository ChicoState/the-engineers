Feature: View User

	Scenario: User account contents

		Given a user visits the user page but has not logged in
		But then this user will be redirected to the login page
		Then when the user enters in valid information and goes to the user page
		Then they should see the user page

		Given a logged in user wants to see his account at "/u/1"
		Then on the user page there should be the logo "3DEx"
		And so this user clicks on it they should be redirected to the home page

		Given a logged in user wants to see his account at "/u/1"
		Then on the user page there should be a link to Browse
		And so this user clicks on it they should be redirected to the view-all page

		Given a logged in user wants to see his account at "/u/1"
		Then on the user page there should be a link to Create
		And so this user clicks on it they should be redirected to the user create page

		Given a logged in user wants to see his account at "/u/1"
		Then on the user page there should be a link to Upload
		And so this user clicks on it they should be redirected to the upload page

		Given a logged in user wants to see his account at "/u/1"
		Then on the user page there should be a link to My Library
		And so this user clicks on it they should be redirected to the my library page
		Given a logged in user wants to see his account at "/u/1"
		Then on the user page there should be a link to Logout
		And so this user clicks on it they should be redirected to the login page

		Given a logged in user wants to see his account at "/u/1"
		Then on the user page there should be a link to About

		Given a logged in user wants to see his account at "/u/1"
		Then on the user page there should be a link to Contact

		Given a logged in user wants to see his account at "/u/1"
		Then on the user page there should be a link to Legal

		Given a logged in user wants to see his account at "/u/1"
		Then the user should see all his designs
		And below that the descriptions of the designs
		And a Purchase link
		And a Learn More link
		And his username
		And a info button
		And a Licenses button
