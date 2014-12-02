Feature: Signing in

	Scenario: Unsuccessful Login
		Given a user visits the Login page
		Then on the login page there should be the logo "3DEx"
		And as user clicks on it they should be redirected to the home page

		Given a user visits the Login page
		Then on the login page there should be a link to Browse
		And as user clicks on it they should be redirected to the view-all page

		Given a user visits the Login page
		Then on the login page there should be a link to Create
		And as user clicks on it they should be redirected to the user create page

		Given a user visits the Login page
		Then on the login page there should be a link to Upload
		And as user clicks on it they should be redirected to the login page

		Given a user visits the Login page
		Then on the login page there should be a link to Login
		And as user clicks on it they should be redirected to the login page

		Given a user visits the Login page
		Then on the login page there should be a link to About

		Given a user visits the Login page
		Then on the login page there should be a link to Contact

		Given a user visits the Login page
		Then on the login page there should be a link to Legal	

		#Begin comment
		#Features not added yet
		#Given a user visits the Login page
		#When they submit an email for the username
		#Then they should see an error message

		#Given a user visits the Login page
		#When they submit "~!@#$%^&*()_+=-`,./<>?;':[]\|}" for the username
		#Then they should see an error message

		#Given a user visits the Login page
		#When they submit the username "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
		#Then they should see an error message

		#Given a user visits the Login page
		#When they submit spaces in the username
		#Then they should see an error message

		#Given a user visits the Login page
		#When they submit no information for the username and password
		#Then they should see an error message

		#Given a user visits the Login page
		#When they submit a space for the username
		#Then they should see an error message
		#End comments

		Given a user visits the Login page
		When they submit a password under 4 characters
		Then they should see an error message

	Scenario: Successful Login
		Given a user visits the Login page
		When they submit a user information that is in the database
		Then they should see their user account
