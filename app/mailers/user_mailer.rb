class UserMailer < ApplicationMailer

  default from: "utkarshrai003@gmail.com"

  def signup_confirmation(user)
  	@user = user  # making global to get access in the view
    @greeting = "Thank you for signing up.."
    mail(:to =>  @user.email, :subject => "Sign up confirmation")
  end

  def signin_confirmation(user)
  	@user = user
  	@greeting = "you were successfully signed in..."
  	mail(:to => @user.email , :subject => "Sign in confirmation")
  end

  def notify(id , email_was)
    @user = User.find(id)
    @email_was = email_was
    @greeting = "you have changed your email"
    attachments.inline['cb.png'] = File.read('public/cb.png')
    mail(:to => @user.email , :subject => "Email changed")
    # commenttinh
  end

end
