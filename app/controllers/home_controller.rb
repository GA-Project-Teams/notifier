class HomeController < ApplicationController
  before_filter :authenticate_user!
  def index
    if (current_user.has_role? :admin)
    	path = new_message_path
    else
    	path = edit_user_path(current_user)
    end

    redirect_to path
  end
end
