class Message < ActiveRecord::Base
  belongs_to :user
  # attr_accessible :content, :user_id, :from_user_id, :message_type_id
  attr_accessible :content, :user_id, :from_user_id, :message_type_id
  
  validates :content, :presence => true
  validates :user_id, :presence => true
  validates :from_user_id, :presence => true
  validates :message_type_id, :presence => true
  
  private
  
  def send_notification(to_user, message)
    if (message.message_type_id == 3)
      send_email(to_user, message)
      send_text_message(to_user, message)
    elsif (message.message_type_id == 2)
      send_email(to_user, message)
    elsif (message.message_type_id == 1)
      send_text_message(to_user, message)
    end
  end
  
  def send_text_message(to_user, message)
    twilio_sid = ENV['TWILIO_SID']
    twilio_token = ENV['TWILIO_TOKEN']
    twilio_phone_number = ENV['TWILIO_PHONE_NUMBER']
    
    @twilio_client = Twilio::REST::Client.new(twilio_sid, twilio_token)
    
    @twilio_client.account.sms.messages.create(
      :from => "+1#{twilio_phone_number}",
      :to => to_user.phone_number,
      :body => message.content
    )
  end
  
  def send_email(to_user, message)
    UserMailer.notify_user(to_user, message).deliver
  end
end
