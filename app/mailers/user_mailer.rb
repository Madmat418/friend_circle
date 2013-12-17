class UserMailer < ActionMailer::Base
  default from: "admin@friendcircle.com"

  def password_reset(user, reset_token)
    @user = user
    @url = "http://localhost:3000/forgotten_passwords/#{reset_token}"
    mail(:to => @user.email, :subject => "Resetting Your Password")
  end
end
