class ApplicationController < ActionController::Base

  # make @current_user available to views
  helper_method :current_user, :is_logged_in

  # run this on every single page
  before_action :current_user, :is_logged_in
  def current_user
    if is_logged_in
      @current_user = User.find(session[:user_id])
    else
      @current_user = nil
      
    end
    @current_user 
    
  end
  
  def is_logged_in
    session[:user_id].present?
  end

  def reset_session
    @_request.reset_session
  end

end

