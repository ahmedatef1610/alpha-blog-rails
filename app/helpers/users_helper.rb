module UsersHelper
  def gravatar_for(user, options = {size: 80})
    # get the email from URL-parameters or what have you and make lowercase
    email_address = user.email.downcase
    # create the md5 hash
    hash = Digest::MD5.hexdigest(email_address)
    size = options[:size]
    # compile URL which can be used in <img src="RIGHT_HERE"...
    image_src = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
    image_tag(image_src, alt: user.username, class: "rounded mx-auto d-block shadow" ) 
  end
end
