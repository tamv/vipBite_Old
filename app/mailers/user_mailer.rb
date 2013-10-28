class UserMailer < ActionMailer::Base
  default :from => "vipBite@gmail.com"

  def passwordRequest(user, newpwd)
    @greeting = "Hi";
    @user = user;
    @newpwd = newpwd;
    mail to: user.login, subject: "Password for you vipBite Account"
  end

  def supportEmail(user, content)
  	@user = user;
  	@content = content;
  	subject = "Support Inquirey from" + user.user_firstName + user.user_lastName;
  	mail to: user.login, subject: subject
  end
end
