class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
      )

    if @user
      log_in(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] ||= []
      flash.now[:errors] << "Invalid Email-Password combination"
      render :new
    end
  end


  def destroy
    current_user.reset_session_token!
    session[:token] = nil
    redirect_to new_session_url
  end

end
