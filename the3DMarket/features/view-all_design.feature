Feature: View all designs

	Scenario: Design

		Given a user visits the "/d/view-all"
		Then on the view-all page there should be the logo "3DEx"
		And on the view-all page there should be a link to Browse
		And on the view-all page there should be a link to Create
		And on the view-all page there should be a link to Upload
		And on the view-all page there should be a link to Login
		And on the view-all page there should be a link to About
		And on the view-all page there should be a link to Contact
		And on the view-all page there should be a link to Legal
		And on the view-all page there should be a link to Purchase
		And on the view-all page there should be a link to Learn more

		And on the view-all page there should be the title "Library"
		And on the view-all page there should be the 3D design title "A 3D Tree"

		And on the view-all page underneath the 3D design title, there should be a description of the 3D model

		And on the view-all page there should be a 3D image of the 3D Tree

