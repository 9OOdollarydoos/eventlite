class SessionsController < ApplicationController

  def new
  end
  
  def create
    user = User.find_by(username: session_params[:username])
    if user
      session[:user_id] = user.id
      redirect_to root_path, notice: "Logged in"
    else
      flash.now[:alert] = "Invalid username"
      render "new"
    end
  end
  
  def destroy
    session.delete(:user_id)
    redirect_to root_path, notice: "Logged out"
  end
  
  private

  def session_params
    params.permit(:username)
  end

end
