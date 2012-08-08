class UsersController < ApplicationController
  before_filter :authenticate_user!
  # before_filter :insert_password, :only => [:new, :create]
  def index
    
  end

  def show
    @users = User.all
  end
  
  def new
    @user = User.new
    @user.password = User.reset_password_token
    @user.reset_password_token = User.reset_password_token
  end

  def create
    # generated_password = Devise.friendly_token.first(6)
    # @user = User.new(params[:user], :password => generated_password, :password_confimration => generated_password)
    @user = User.new(params[:user])
    # @user.skip_confirmation!
    if @user.save
      redirect_to(@user, :notice => 'User was successfully created.')
    else
      render action: 'edit'
    end
  end
  
  def edit
    @user = User.find(params[:id]) 
  end
  
  def update
    @user = User.find(params[:id]) 
    if @user.update_attributes(params[:user])
      redirect_to :root_path
    else
      render action: 'edit'
    end
  end
  
  
  private
  
  def insert_password
    @user.password = 'password'
    @user.password_confirmation = 'password'
  end
end
