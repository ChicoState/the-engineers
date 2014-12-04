Feature: Library

	Scenario: Library contents
	
		Given a user visits the user library page but has not logged in
		And then this user should be redirected to the login page
		But when the user enters in valid information and goes to the user library page
		Then they should see the user library page

		Given a logged in user wants to see his library at "/u/library"
		Then on the user library page there should be the logo "3DEx"
		And this user clicks on it they should be redirected to the home page

		Given a logged in user wants to see his library at "/u/library"
		Then on the user library page there should be a link to Browse
		And this user clicks on it they should be redirected to the view-all page

		Given a logged in user wants to see his library at "/u/library"
		Then on the user library page there should be a link to Create
		And this user clicks on it they should be redirected to the user create page

		Given a logged in user wants to see his library at "/u/library"
		Then on the user library page there should be a link to Upload
		And this user clicks on it they should be redirected to the upload page

		Given a logged in user wants to see his library at "/u/library"
		Then on the user library page there should be a link to My Library
		And this user clicks on it they should be redirected to the my library page
		Given a logged in user wants to see his library at "/u/library"
		Then on the user library page there should be a link to Logout
		And this user clicks on it they should be redirected to the login page

		Given a logged in user wants to see his library at "/u/library"
		Then on the user library page there should be a link to About

		Given a logged in user wants to see his library at "/u/library"
		Then on the user library page there should be a link to Contact

		Given a logged in user wants to see his library at "/u/library"
		Then on the user library page there should be a link to Legal

		Given a logged in user wants to see his library at "/u/library"
		Then on the user library page there should be the title "My Library"
		And all the user's designs should be displayed
		And a description for each design
		And there should be a View Details link under each design
