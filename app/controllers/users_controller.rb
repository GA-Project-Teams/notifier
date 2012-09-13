class UsersController < ApplicationController
  before_filter :authenticate_user!
  respond_to    :html, :json
  
  load_and_authorize_resource

  def index
    @search = User.search(params[:q])
    @users = @search.result.by_company

    respond_with(@users)
    
  end

  def show
    @user = get_user(params[:id]) 
  end
  
  def new
    @user = User.new
    @user.enable_strict_validation = true
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      # UserMailer.signup_confirmation(@user).deliver
      redirect_to(@user, :notice => 'CONTACT ADDED Success! Your contact has been added and an email has been sent to the address provided.')
    else
      render :new
    end
  end
  
  def edit
    @user = get_user(params[:id]) 
  end
  
  def update
    @user = get_user(params[:id]) 
    if @user.update_attributes(params[:user])
      # sign_in @user, :bypass => true
      redirect_to(@user, :notice => 'CONTACT UPDATE Success!')
    else
      render :edit
    end
  end
  
  def destroy
    @user = get_user(params[:id])
    if @user.destroy
      redirect_to users_path
    end
  end 

  private

  def get_user(user_id)
    User.find(user_id)
  end

end
