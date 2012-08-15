class MessagesController < ApplicationController
  def new
    @message = Message.new
  end
  
  def create
    @message = Message.new(params[:message])
    @to_user = User.find(@message.to_user_id)
    if @message.save
      UserMailer.notify_user(@to_user, @message).deliver
      redirect_to(new_message_path, :notice => 'Notification sent!')
    else
      render action: 'new'
    end
  end
end
