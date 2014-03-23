class ApplicationController < ActionController::Base

  protect_from_forgery

  def is_admin?
    current_user && current_user.admin?
  end

  def is_admin
    if not is_admin?
      flash[:error] = "Error: Not an admin"
      redirect_to root_path
      return
    end
    return true    
  end

  def signed_in
    if not user_signed_in?
      flash[:error] = "Error: Not signed in"
      redirect_to new_user_session_path
      return
    end
    return true
  end

end
