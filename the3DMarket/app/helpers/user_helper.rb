module UserHelper

	def gravatar_for(user)
		gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
		gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
		image_tag("http://placekitten.com/g/200/300", alt: gravatar_url, class: "gravatar")
	end
end
