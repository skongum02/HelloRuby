class UserMailer < ActionMailer::Base
  default from: "noreply@example.com"
  
  def welcome_email(user)
    @user = user
    @url = ''
    mail(to: @user['to'], subject: @user['subject'], body: @user['body'])
  end
end
