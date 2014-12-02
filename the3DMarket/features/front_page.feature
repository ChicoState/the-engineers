Feature: Front Page

	Scenario: Front Page Contents

		Given a user visits the front page
		Then on the front page there should be the logo "3DEx"
		And if a user clicks on it they should be redirected to the home page

		Given a user visits the front page
		Then on the front page there should be a link to Browse
		And if a user clicks on it they should be redirected to the view-all page

		Given a user visits the front page
		Then on the front page there should be a link to Create
		And if a user clicks on it they should be redirected to the user create page

		Given a user visits the front page
		Then on the front page there should be a link to Upload
		And if a user clicks on it and is not logged in they should be redirected to the login page
		But as the user logs in with valid user information and click upload
		Then the user should be redirected to the upload page

		Given a user visits the front page
		Then on the front page there should be a link to Login
		And if a user clicks on it they should be redirected to the login page

		Given a user visits the front page
		Then on the front page there should be a link to About

		Given a user visits the front page
		Then on the front page there should be a link to Contact

		Given a user visits the front page
		Then on the front page there should be a link to Legal

		Given a user visits the front page
		Then on the front page there should be the title "Featured Design"
		And the name of the design called "Design"
		And under the name should be a description of the design
		And there should be a purchase link
		And there should be a learn more link
