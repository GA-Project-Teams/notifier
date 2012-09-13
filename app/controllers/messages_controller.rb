class MessagesController < ApplicationController
  before_filter :authenticate_user!

  load_and_authorize_resource

  def new
    @message = Message.new
    @user = User.find(params[:user_id]) if params[:user_id]
  end
  
  def create
    @message = Message.new(params[:message])
    if @message.save
      redirect_to(new_message_path, :notice => 'Notification sent!')
    else
      render :new
    end
  end

end
