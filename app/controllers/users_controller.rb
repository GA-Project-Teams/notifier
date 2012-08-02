class UsersController < ApplicationController
  before_filter :authenticate_user!
  
  def index
  end

  def show
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to :root_path
    end
  end
  
end
