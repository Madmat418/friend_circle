class UsersController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      log_in(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] ||= []
      flash.now[:errors] << @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  def password_reset
    @user = User.find_by_reset_token(params[:reset_token])
    render :password_reset
  end

end
