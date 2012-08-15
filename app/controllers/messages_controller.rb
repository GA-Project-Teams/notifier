class MessagesController < ApplicationController
  before_filter :authenticate_user!
  def new
    @message = Message.new
  end
  
  def create
    @message = Message.new(params[:message])
    @to_user = User.find(@message.to_user_id)
    if @message.save
      if (@to_user.preference == 3)
        UserMailer.notify_user(@to_user, @message).deliver
        send_text_message(@to_user, @message)
      elsif (@to_user.preference == 2)
        UserMailer.notify_user(@to_user, @message).deliver
      elsif (@to_user.preference == 1)
        send_text_message(@to_user, @message)
      end
      redirect_to(new_message_path, :notice => 'Notification sent!')
    else
      render action: 'new'
    end
  end
  
  private
  
  def send_text_message(to_user, message)
    twilio_sid = 'AC7b40b24acaa4eaf33f11de10105880a6'
    twilio_token = '63c6c31c3bb4b9b2f419fdeedff535d3'
    twilio_phone_number = '8609866818'
    
    @twilio_client = Twilio::REST::Client.new(twilio_sid, twilio_token)
    
    @twilio_client.account.sms.messages.create(
      :from => "+1#{twilio_phone_number}",
      :to => to_user.phone_number,
      :body => message.content
    )
  end
  
end
