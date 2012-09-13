class Message < ActiveRecord::Base
  belongs_to      :user
  after_save      :send_notification
  attr_accessible :content, :user_id, :from_user_id, :message_type_id
  
  validates       :content, :presence => true
  validates       :user_id, :presence => true
  validates       :from_user_id, :presence => true
  validates       :message_type_id, :presence => true

  def send_notification
    if (self.message_type_id == 3)
      send_email
      send_text_message
    elsif (self.message_type_id == 2)
      send_email
    elsif (self.message_type_id == 1)
      send_text_message
    end
  end

  def send_text_message
    user = User.find(self.user_id)
    twilio_sid = ENV['TWILIO_SID']
    twilio_token = ENV['TWILIO_TOKEN']
    twilio_phone_number = ENV['TWILIO_PHONE_NUMBER']
    
    @twilio_client = Twilio::REST::Client.new(twilio_sid, twilio_token)
    
    @twilio_client.account.sms.messages.create(
      :from => "+1#{twilio_phone_number}",
      :to => user.phone_number,
      :body => self.content
    )
  end
  
  def send_email
    user = User.find(self.user_id) 
    UserMailer.notify_user(user, self).deliver
  end

end
