class SessionsController < ApplicationController
  def create
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path
    else
      message = "Username or password not recognized, please try again"
      redirect_to login_path, notice: message
    end
  end
end