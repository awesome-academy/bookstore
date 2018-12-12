class UserMailer < ApplicationMailer

  def happy_birthday user
    @user = user
    mail to: user.email, subject: t(".subject")
  end
end
