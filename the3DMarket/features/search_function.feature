Feature: Search Function

	Scenario: Search Page Contents

		Given a user visits the page "/d/search" to use the search function
		When the user gets to the page it should have the search function
		And the search button
		And the clear button
		And the field Design Name
		And the field Author Name

		Given a user visits the page "/d/search" to use the search function
		Then on the search page there should be the logo "3DEx"
		And then a user clicks on it they should be redirected to the home page

		Given a user visits the page "/d/search" to use the search function
		Then on the search page there should be a link to Browse
		And then a user clicks on it they should be redirected to the view-all page

		Given a user visits the page "/d/search" to use the search function
		Then on the search page there should be a link to Create
		And then a user clicks on it they should be redirected to the user create page

		Given a user visits the page "/d/search" to use the search function
		Then on the search page there should be a link to Upload
		And then a user clicks on it and is not logged in they should be redirected to the login page
		When they log in with valid user information and click upload
		Then they should be redirected to the upload page

		Given a user visits the page "/d/search" to use the search function
		Then on the search page there should be a link to Login
		And then a user clicks on it they should be redirected to the login page

		Given a user visits the page "/d/search" to use the search function
		Then on the search page there should be a link to About

		Given a user visits the page "/d/search" to use the search function
		Then on the search page there should be a link to Contact

		Given a user visits the page "/d/search" to use the search function
		Then on the search page there should be a link to Legal

	Scenario: Searching with missing arguments

		Given a user visits the page "/d/search" to use the search function
		When the user enters no arguments and clicks search
		Then all designs should be displayed
		And the search function should be there

		Given a user visits the page "/d/search" to use the search function
		When the user enters "a" into the design name field and clicks search
		Then all designs should be displayed

		Given a user visits the page "/d/search" to use the search function
		When the user enters "A 3D Tree" in the design name field and clicks search
		Then only the 3D Tree design should be displayed

		Given a user visits the page "/d/search" to use the search function
		When the user enters "Some Design Not In Database" to the design name field and clicks search
		Then no designs should be displayed

		Given a user visits the page "/d/search" to use the search function
		When the user enters "test" to the author name field and clicks search
		Then all designs should be displayed

		Given a user visits the page "/d/search" to use the search function
		When the user enters "Some Guy Not In Database" into the author name field and clicks search
		Then no designs should be displayed

	Scenario: Searching with all arguments

		Given a user visits the page "/d/search" to use the search function
		When the user enters "A 3D Tree" into the design name field 
		And "test" into the author name field and clicks search
		Then only the 3D Tree design should be displayed

		Given a user visits the page "/d/search" to use the search function
		When the user enters "Some Design Not In Database" in the design name field 
		And "Some Guy Not In Database" in the author name field and clicks search
		Then no designs should be displayed

