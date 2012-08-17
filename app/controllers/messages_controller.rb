class MessagesController < ApplicationController
  before_filter :authenticate_user!
  def new
    @message = Message.new
  end
  
  def create
    @message = Message.new(params[:message])   
    if @message.save
      send_notification(@user, @message)
      redirect_to(notify_message_path, :notice => 'Notification sent!')
    else
      render action: 'new'
    end
  end
  
  def notify
    @message = Message.new
    @user = User.find(params[:id])
  end

end
