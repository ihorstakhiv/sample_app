class SessionsController < ApplicationController
  def new
  end

  def create
    if user.activated?
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_back_or user
    else
      message  = "Account not activated. "
      message += "Check your email for the activation link."
      flash[:warning] = message
      redirect_to root_url
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
