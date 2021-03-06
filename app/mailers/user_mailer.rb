class UserMailer < ActionMailer::Base
  default from: "notifier@ga-notifier.herokuapp.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.signup_confirmation.subject
  #
  def signup_confirmation(new_user)
    # @greeting = "Hi"
    @resource = new_user
    
    # mail to: new_user.email
    mail(to: @resource.email, subject: "Welcome!", :tag => 'password-reset', :content_type => "text/html") do |format|
      format.html { render "user_mailer/signup_confirmation" }
    end
      
  end
  
  def edit_contact_info(edit_user)
    @resource = edit_user
    
    mail(to: @resource.email, subject: "Contact information updated", :content_type => "text/html") do |format|
      format.html { render "user_mailer/edit_contact_info" }
    end
  end
  
  def notify_user(to_user, message)
    # to_user = User.find(message.to_user_id)
    @resource = to_user
    @body = message.content
    
    mail(to: @resource.email, subject: "You've received a new notification", :content_type => "text/html") do |format|
      format.html { render "user_mailer/notify_user" }
    end
  end
end
