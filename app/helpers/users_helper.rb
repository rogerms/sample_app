module UsersHelper
	# Returns the Gravatar (http://gravatar.com/) for the given user.
	def gravatar_for(user, options = { size: 50 })
		gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
		size = options[:size]
		gravatar_url = "http://www.gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
		image_tag(gravatar_url, alt: user.name, class: "gravatar")
	end
	
	def full_title(page_title)
		base_title = "Ruby on Rails Tutorial Sample App"
		if page_title.empty?
			base_title
		else
			"#{base_title} | #{page_title}"
		end
    end
end
