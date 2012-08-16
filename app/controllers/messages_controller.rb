class MessagesController < ApplicationController
  before_filter :authenticate_user!
  def new
    @message = Message.new
    # @to_user_id = User.find(params[:to_user_id])
    # @message_type_id = params[:message_type_id]
  end
  
  def create
    @message = Message.new(params[:message])
    @to_user = User.find(@message.to_user_id)
    if @message.save
      if (@message.message_type_id == 3)
        UserMailer.notify_user(@to_user, @message).deliver
        send_text_message(@to_user, @message)
      elsif (@message.message_type_id == 2)
        UserMailer.notify_user(@to_user, @message).deliver
      elsif (@message.message_type_id == 1)
        send_text_message(@to_user, @message)
      end
      redirect_to(new_message_path, :notice => 'Notification sent!')
    else
      render action: 'new'
    end
  end
  
  def notify
    @message = Message.new
    @user = User.find(params[:id])
    # @message_type_id = params[:message_type_id]
  end
  
  private
  
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
  
end
