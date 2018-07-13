class SessionsController < ApplicationController
  def new
    session[:session_token] = nil
    render :new
  end

  def create
    user = User.find_by_credentials(params[:user][:email], params[:user][:password])

    if user.nil?
      flash.now[:errors] = ['incorrect login info']
      render :new
    else
      log_in!(user)
      redirect_to user_url(user)
    end
  end

  def destroy
    session[:session_token] = nil
    render :new
  end
end
