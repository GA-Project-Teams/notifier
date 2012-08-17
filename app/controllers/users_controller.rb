class UsersController < ApplicationController
  before_filter :authenticate_user!
  # before_filter :insert_password, :only => [:new, :create]
  def index
    @users = User.all
    respond_to do |format|
      format.html
      format.json { render json: @users }
    end
    
    
  end

  def show
    @user = User.find(params[:id]) 
  end
  
  def new
    @user = User.new
    @user.enable_strict_validation = true
  end

  def create
    # generated_password = Devise.friendly_token.first(6)
    # @user = User.new(params[:user], :password => generated_password, :password_confimration => generated_password)
    @user = User.new(params[:user])
    # @user.skip_confirmation!
    # @user.enable_strict_validation = true
    # @user.reset_password_token = User.reset_password_token
    # @user.reset_password_sent_at = Time.now
    if @user.save
      UserMailer.signup_confirmation(@user).deliver
      redirect_to(@user, :notice => 'CONTACT ADDED Success! Your contact has been added and an email has been sent to the address provided.')
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
      # UserMailer.edit_contact_info(@user).deliver
      sign_in @user, :bypass => true
      redirect_to(@user, :notice => 'CONTACT UPDATED Success! Your contact will be notified that their contact information has been updated.')
    else
      render action: 'edit'
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to users_path
    end
  end
  
  
  private
  
  def insert_password
    @user.password = 'password'
    @user.password_confirmation = 'password'
  end
end
