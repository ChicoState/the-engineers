Feature: Edit a user

	Scenario: Unsuccessful Edit

		Given a user visits the edit user page but has not logged in
		Then this user will be redirected to the login page
		But when the user enters in valid information and goes to the edit user page
		Then they should see the edit user page

		Given a logged in user wants to edit his information at "/u/view"
		Then on the edit user page there should be the logo "3DEx"
		When the user clicks on it they should be redirected to the home page

		Given a logged in user wants to edit his information at "/u/view"
		Then on the edit user page there should be a link to Browse
		When the user clicks on it they should be redirected to the view-all page

		Given a logged in user wants to edit his information at "/u/view"
		Then on the edit user page there should be a link to Create
		When the user clicks on it they should be redirected to the user create page

		Given a logged in user wants to edit his information at "/u/view"
		Then on the edit user page there should be a link to Upload
		When the user clicks on it they should be redirected to the upload page

		Given a logged in user wants to edit his information at "/u/view"
		Then on the edit user page there should be a link to My Library
		When the user clicks on it they should be redirected to the my library page
		Given a logged in user wants to edit his information at "/u/view"
		Then on the edit user page there should be a link to Logout
		When the user clicks on it they should be redirected to the login page

		Given a logged in user wants to edit his information at "/u/view"
		Then on the edit user page there should be a link to About

		Given a logged in user wants to edit his information at "/u/view"
		Then on the edit user page there should be a link to Contact

		Given a logged in user wants to edit his information at "/u/view"
		Then on the edit user page there should be a link to Legal

		Given a logged in user wants to edit his information at "/u/view"
		When they edit with no email
		Then they should see the email error "Email cannot be blank"

		Given a logged in user wants to edit his information at "/u/view"
		When they edit using their own email as a new email
		Then they should see another email error "That email has already been linked to an account"

		Given a logged in user wants to edit his information at "/u/view"
		When they edit using another user's email as a new email
		Then they should see another email error "That email has already been linked to an account"

		Given a logged in user wants to edit his information at "/u/view"
		When they edit their password but their confirmation password is different
		Then they should see a password error "Your passwords don't match"

		Given a logged in user wants to edit his information at "/u/view"
		When they edit their password but there is no confirmation password
		Then they should see a password error "Your passwords don't match"

		Given a logged in user wants to edit his information at "/u/view"
		When they edit their password but there is no password
		Then they should see a password error "Your passwords don't match"

		Given a logged in user wants to edit his information at "/u/view"
		When they edit their password but their password and confirmation password do not have more than 3 characters
		Then they should see another password error "That password is too short"

	Scenario: Successful Edit

		Given a logged in user wants to edit his information at "/u/view"
		When they edit with a valid email, password, and confirmation password
		Then they should be redirected to the user account page


