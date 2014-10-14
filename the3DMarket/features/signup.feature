Feature: Signing up

	Scenario: Unsuccessful Sign up
		Given a user visits the Signup page "/u/create"
		When they sign up with no username
		Then they should see the user error "There was an error submitting, try again"

		Given a user visits the Signup page "/u/create"
		When they sign up with passwords of different lengths
		Then they should see the password error "Your passwords don't match"
		When they sign up with different passwords of the same length
		Then they should see the password error "Your passwords don't match"
		When they sign up with only confirm_password
		Then they should see the password error "Your passwords don't match"
		When they sign up with only password
		Then they should see the password error "Your passwords don't match"

		Given a user visits the Signup page "/u/create"
		When they sign up with the username "Tom"
		And they go back to the Signup page
		And try to create the user "Tom"
		Then they should see the database error "That username is taken"

		Given a user visits the Signup page "/u/create"
		When they sign up with a password under 4 characters
		Then they should see the short password error "That password is too short"
		When they sign up with no password and confirm_password
		Then they should see the short password error "That password is too short"
	
	Scenario: Successful Signup

		Given a user visits the Signup page "/u/create"
		When they sign up with an email, username, valid password, and valid confirm_password
		Then the sign up was a success and they should not be in the signup page

		Given a user visits the Signup page "/u/create"
		When they sign up with a username, valid password, valid confirm_password and no email
		Then the sign up was a success and they should not be in the signup page
