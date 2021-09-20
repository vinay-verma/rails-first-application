module ApplicationHelper

  def gravatar_for(user, option = { size: 80 })
    size = option[:size]
    gravatar_url = "https://about.me/cdn-cgi/image/q=40,dpr=2,f=auto,fit=cover,w=#{size},h=#{size},gravity=0.331x0.149/https://assets.about.me/background/users/v/i/n/vinay.an32_gmail.com_1464877189_87.jpg"
    image_tag(gravatar_url, alt: user.username)
  end

end
