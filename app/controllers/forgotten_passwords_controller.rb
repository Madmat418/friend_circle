class ForgottenPasswordsController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user
      @reset_token = @user.reset_reset_token!
      msg = UserMailer.password_reset(@user, @reset_token)
      msg.deliver!
      flash[:errors] = ["Email sent"]
      redirect_to new_session_url
    else
      flash.now[:errors] ||= []
      flash.now[:errors] << "Email not registered"
      render :new
    end
  end

  def edit
    @user = User.find_by_reset_token(params[:reset_token])
    render :edit
  end

  def update
    @user = User.find_by_reset_token(params[:reset_token])
    @user.password = params[:password]
    if @user.save
      @user.reset_token = nil
      redirect_to new_session_url
    else
      flash.now[:errors] ||= []
      flash.now[:errors] << @user.errors.full_messages
      render :edit
    end
  end

end
