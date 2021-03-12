class ApplicationController < ActionController::Base

  helper_method :require_sign_in, :current_user

  def current_user
    session[:user_id]
  end
  
  def require_sign_in
    unless current_user
      flash[:error] = "You must be logged in"
      redirect_to new_session_path
    end
  end



end
