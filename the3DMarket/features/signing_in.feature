Feature: Signing in

	Scenario: Unsuccessful Login
		Given a user visits the Login page
		When they submit invalid information
		Then they should see an error message
		
		Given a user visits the Login page
		When they submit invalid information_2
		Then they should see an error message

		Given a user visits the Login page
		When they submit invalid information_3
		Then they should see an error message

		Given a user visits the Login page
		When they submit invalid information_4
		Then they should see an error message

		Given a user visits the Login page
		When they submit invalid information_5
		Then they should see an error message

		Given a user visits the Login page
		When they submit invalid information_6
		Then they should see an error message

		Given a user visits the Login page
		When they submit invalid information_7
		Then they should see an error message

		Given a user visits the Login page
		When they submit invalid information_8
		Then they should see an error message

		Given a user visits the Login page
		When they submit invalid information_9
		Then they should see an error message

	Scenario: Successful Login
		Given a user visits the Login page
		When they submit valid information
		Then they should see the logout page

		Given a user visits the Login page
		When they submit valid information_2
		Then they should see the logout page

		Given a user visits the Login page
		When they submit valid information_3
		Then they should see the logout page

		Given a user visits the Login page
		When they submit valid information_4
		Then they should see the logout page

		Given a user visits the Login page
		When they submit valid information_5
		Then they should see the logout page
