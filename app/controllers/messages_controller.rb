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
        # sends sms
      elsif (@to_user.preference == 2)
        UserMailer.notify_user(@to_user, @message).deliver
      elsif (@to_user.preference == 1)
        # sends sms
      end
      redirect_to(new_message_path, :notice => 'Notification sent!')
    else
      render action: 'new'
    end
  end
  
end
