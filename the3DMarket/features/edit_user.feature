Feature: Edit a user

	Scenario: Unsuccessful Edit
		Given a user wants to edit his information at "/u/1/view"
		When they edit with no email
		Then they should see the email error "Email cannot be blank"

		Given a user wants to edit his information at "/u/1/view"
		When they edit using their own email as a new email
		Then they should see another email error "That email has already been linked to an account"

		Given a user wants to edit his information at "/u/1/view"
		When they edit using another user's email as a new email
		Then they should see another email error "That email has already been linked to an account"

		Given a user wants to edit his information at "/u/1/view"
		When they edit their password but their confirmation password is different
		Then they should see a password error "Your passwords don't match"

		Given a user wants to edit his information at "/u/1/view"
		When they edit their password but there is no confirmation password
		Then they should see a password error "Your passwords don't match"

		Given a user wants to edit his information at "/u/1/view"
		When they edit their password but there is no password
		Then they should see a password error "Your passwords don't match"

		Given a user wants to edit his information at "/u/1/view"
		When they edit their password but their password and confirmation password do not have more than 3 characters
		Then they should see another password error "That password is too short"

	Scenario: Successful Edit

		Given a user wants to edit his information at "/u/1/view"
		When they edit with a valid email, password, and confirmation password
		Then they should be redirected to the login page


