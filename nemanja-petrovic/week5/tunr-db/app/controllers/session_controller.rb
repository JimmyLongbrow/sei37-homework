class SessionController < ApplicationController
  def new
  end

  def create
    user = User.find_by email: params[:email]
    if user.present? && user.authenticate( params[:password])
      session[:user_id] = user.id
      redirect_to home_path
    else
      flash[:error] = 'Invalid email or password'
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil #log out function
    redirect_to login_path #go back to the login page
  end
end
