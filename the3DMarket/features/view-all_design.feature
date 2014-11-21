Feature: View all designs

	Scenario: Design

		Given a user visits the "/d/view-all"
		Then on the view-all page there should be the logo "3DEx"
		And when a user clicks on it they should be redirected to the home page

		Given a user visits the "/d/view-all"
		Then on the view-all page there should be a link to Browse
		And when a user clicks on it they should be redirected to the view-all page

		Given a user visits the "/d/view-all"
		Then on the view-all page there should be a link to Create
		And when a user clicks on it they should be redirected to the user create page

		Given a user visits the "/d/view-all"
		Then on the view-all page there should be a link to Upload
		And when a user clicks on it and is not logged in they should be redirected to the login page
		But when they log in with valid user information and click upload
		Then they should be directed to the upload page

		Given a user visits the "/d/view-all"
		Then on the view-all page there should be a link to Login
		And when a user clicks on it they should be redirected to the login page

		Given a user visits the "/d/view-all"
		Then on the view-all page there should be a link to About

		Given a user visits the "/d/view-all"
		Then on the view-all page there should be a link to Contact

		Given a user visits the "/d/view-all"
		Then on the view-all page there should be a link to Legal

		Given a user visits the "/d/view-all"
		And on the view-all page there should be the title "View All Designs"
		And on the view-all page there should be a search function
		And on the view-all page there should be the 3D design title "A 3D Tree"
		And on the view-all page underneath the 3D design title, there should be a description of the 3D model
		And on the view-all page there should be a 3D image of the 3D Tree
		And on the view-all page there should be a link View details
		And when a user clicks on it they should be redirected to the 3D item's design page

