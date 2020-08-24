class ApplicationController < ActionController::Base
  before_action :fetch_user
  def fetch_user
    if session[:user_id].present?
      @current_user = User.find_by id: session[:user_id]
    end #if
    unless @current_user.present?
      session[:user_id] = nil
    end #unless
  end #fetch

  def check_if_logged_in
    redirect_to login_path unless @current_user.present?
  end    
end
