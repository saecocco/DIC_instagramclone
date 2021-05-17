class SessionsController < ApplicationController
    skip_before_action :login_required, only [:new,:create]
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authentivate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
      flash.now[:danger] = 'Failed login'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
end
