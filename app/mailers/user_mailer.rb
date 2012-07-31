class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.signup_confirmation.subject
  #
  def signup_confirmation
    @greeting = "Hi"

    result = mail to: "pt9386@gmail.com"
    
    return result
  end
end
