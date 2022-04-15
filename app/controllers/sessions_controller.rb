class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password]) && user.is_admin ===true
      log_in user
      redirect_to layoutadmin_path
    elsif user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy 
    log_out if logged_in?
    flash[:success] = "You are logged out"
    redirect_to login_path
  end
end
